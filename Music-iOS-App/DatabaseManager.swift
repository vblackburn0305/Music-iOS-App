import Foundation
import SQLite

/// Represents the current state of a single quiz.
struct QuizState {
    let id: Int64?        // Primary key (auto-increment)
    let levelName: String // e.g. "Grade 1", "Grade 2", etc.
    let didPass: Bool     // Has the user passed this quiz yet?
    let hasGoldStar: Bool // Should we show a gold star in the UI?
}

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private var db: Connection?

    // MARK: - Table & Columns
    private let quizzesTable = Table("quizzes")
    private let id = SQLite.Expression<Int64>("id")
    private let level = SQLite.Expression<String>("level")
    private let didPass = SQLite.Expression<Bool>("didPass")
    private let hasGoldStar = SQLite.Expression<Bool>("hasGoldStar")
    
    // MARK: - Init
    private init() {
        do {
            // 1) Get path to Documents directory
            let documentsDirectory = FileManager.default.urls(
                for: .documentDirectory,
                in: .userDomainMask
            ).first!
            let dbPath = documentsDirectory
                .appendingPathComponent("music_quizzes.sqlite").path
            
            // 2) Create or open the database
            db = try Connection(dbPath)
            
            // 3) Create the "quizzes" table if it doesn’t exist
            try db?.run(quizzesTable.create(ifNotExists: true) { table in
                table.column(id, primaryKey: .autoincrement)
                table.column(level, unique: true)
                // Removing defaultValue here:
                table.column(didPass)
                table.column(hasGoldStar)
            })
        } catch {
            print("ERROR: Could not initialize SQLite database: \(error)")
        }
    }
    
    // MARK: - CRUD Methods
    
    /// Insert a quiz record if it does not already exist in DB.
    func insertQuiz(levelName: String) {
        guard let db = db else { return }
        do {
            // If a record for this level already exists, skip insertion
            if getQuizState(for: levelName) != nil {
                return
            }
            // Just set both booleans to false when inserting:
            let insert = quizzesTable.insert(
                level <- levelName,
                didPass <- false,
                hasGoldStar <- false
            )
            try db.run(insert)
        } catch {
            print("ERROR: Inserting quiz: \(error)")
        }
    }
    
    /// Fetch the quiz state (pass/fail, star) for a given level name.
    func getQuizState(for levelName: String) -> QuizState? {
        guard let db = db else { return nil }
        do {
            let query = quizzesTable.filter(level == levelName)
            if let row = try db.pluck(query) {
                return QuizState(
                    id: row[id],
                    levelName: row[level],
                    didPass: row[didPass],
                    hasGoldStar: row[hasGoldStar]
                )
            }
        } catch {
            print("ERROR: Fetching quiz state: \(error)")
        }
        return nil
    }
    
    /// Update the pass/fail and gold star status for the specified quiz.
    func updateQuiz(levelName: String, passed: Bool, goldStar: Bool) {
        guard let db = db else { return }
        do {
            let quizRow = quizzesTable.filter(level == levelName)
            try db.run(
                quizRow.update(
                    didPass <- passed,
                    hasGoldStar <- goldStar
                )
            )
        } catch {
            print("ERROR: Updating quiz state: \(error)")
        }
    }
    
    /// Get all quizzes (e.g., for listing in a table).
    func getAllQuizzes() -> [QuizState] {
        guard let db = db else { return [] }
        var results = [QuizState]()
        do {
            for row in try db.prepare(quizzesTable) {
                let quiz = QuizState(
                    id: row[id],
                    levelName: row[level],
                    didPass: row[didPass],
                    hasGoldStar: row[hasGoldStar]
                )
                results.append(quiz)
            }
        } catch {
            print("ERROR: Fetching quizzes: \(error)")
        }
        return results
    }
}
