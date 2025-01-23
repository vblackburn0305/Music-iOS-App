import Foundation
import SQLite

/// Represents the current state of a single quiz.
struct QuizState {
    let id: Int64?         // Primary key (auto-increment)
    let levelName: String  // e.g. "Level 1"
    let didPass: Bool      // true if user passed
    let hasGoldStar: Bool  // true if user earned a star
    let hasAttempted: Bool // NEW: true if the quiz has ever been finished (pass OR fail)
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
    private let hasAttempted = SQLite.Expression<Bool>("hasAttempted") // NEW
    
    // MARK: - Init
    private init() {
        do {
            // 1) Get path to Documents directory
            let documentsDirectory = FileManager.default.urls(
                for: .documentDirectory,
                in: .userDomainMask
            ).first!
            let dbPath = documentsDirectory
                .appendingPathComponent("quizzes.sqlite").path
            
            // 2) Create or open the database
            db = try Connection(dbPath)
            
            // 3) Create the "quizzes" table if it doesn’t exist
            try db?.run(quizzesTable.create(ifNotExists: true) { table in
                table.column(id, primaryKey: .autoincrement)
                table.column(level, unique: true)
                table.column(didPass, defaultValue: false)
                table.column(hasGoldStar, defaultValue: false)
                // The new column with a default value
                table.column(hasAttempted, defaultValue: false)
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
            let insert = quizzesTable.insert(
                level <- levelName,
                didPass <- false,
                hasGoldStar <- false,
                hasAttempted <- false
            )
            try db.run(insert)
        } catch {
            print("ERROR: Inserting quiz: \(error)")
        }
    }
    
    func getQuizState(for levelName: String) -> QuizState? {
        guard let db = db else { return nil }
        do {
            let query = quizzesTable.filter(level == levelName)
            if let row = try db.pluck(query) {
                return QuizState(
                    id: row[id],
                    levelName: row[level],
                    didPass: row[didPass],
                    hasGoldStar: row[hasGoldStar],
                    hasAttempted: row[hasAttempted] // NEW
                )
            }
        } catch {
            print("ERROR: Fetching quiz state: \(error)")
        }
        return nil
    }
    
    /// Update the pass/fail and gold star status for the specified quiz,
    /// and mark hasAttempted = true every time a quiz finishes.
    func updateQuiz(levelName: String, passed: Bool, goldStar: Bool) {
        guard let db = db else { return }
        do {
            let quizRow = quizzesTable.filter(level == levelName)
            try db.run(
                quizRow.update(
                    didPass <- passed,
                    hasGoldStar <- goldStar,
                    hasAttempted <- true   // always true on finishing a quiz
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
                    hasGoldStar: row[hasGoldStar],
                    hasAttempted: row[hasAttempted]
                )
                results.append(quiz)
            }
        } catch {
            print("ERROR: Fetching quizzes: \(error)")
        }
        return results
    }
}
