//
//  GameServices.swift
//  Partyvity
//
//  Created by Raul Batista on 24.1.18.
//

import Foundation
import Torch

final class GameServices {

    var seconds = 60
    var timer_t = Timer()
    private let database: Database

    init(database: Database) {
        self.database = database
    }

    func counter(){
        if (seconds > 0){
            seconds -= 1
        }

        if (seconds == 0) {
            timer_t.invalidate()

        }

    }

}
