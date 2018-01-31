//
//  Word.swift
//  Partyvity
//
//  Created by Raul Batista on 26.1.18.
//

import Foundation
import UIKit

struct Word: Codable {
    let text: String
    let points: Int

    enum CodingKeys: String, CodingKey {
        case text = "word"
        case points
    }
}
