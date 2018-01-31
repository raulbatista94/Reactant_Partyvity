//
//  Team.swift
//  Partyvity
//
//  Created by Raul Batista on 24.1.18.
//

import Foundation
import UIKit
import Torch

struct Team: TorchEntity {
    var id: Int?
    var name: String
    var score: Int
    var rounds: Int
    var timeStamp: Date
}
