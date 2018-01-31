//
//  ActivityService.swift
//  Partyvity
//
//  Created by Raul Batista on 25.1.18.
//

import Foundation

final class ActivityService {
    private static let activities = ["Draw", "Describe", "Pantomime"]

    var allWords: [Word] {
        let path = Bundle.main.path(forResource: "words", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        guard let data = try? Data(contentsOf: url) else { return [] }
        guard let words = try? JSONDecoder().decode([Word].self, from: data) else { return [] }

        return words
    }

    func randomActivity() -> String {
        let randomIndex = Int(arc4random_uniform(UInt32(ActivityService.activities.count)))
        return ActivityService.activities[randomIndex]
    }

    //    func randomWord() -> String {
    //        let randomIndex = Int(arc4random_uniform(UInt32(allWords.count)))
    //        guard let path = Bundle.main.path(forResource: "random", ofType: "txt")
    //            else { return "Error..."}
    //        do {
    //            let fileContent = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
    //            allWords = fileContent.components(separatedBy: "\n")
    //        }
    //        return allWords[randomIndex]
    //    }

    func randomWord(difficulty: Int) -> String {
        let words = allWords.filter { $0.points == difficulty }
        let randomIndex = Int(arc4random_uniform(UInt32(words.count)))
        return words[randomIndex].text
    }
}
