//
//  GameRootView.swift
//  Partyvity
//
//  Created by Raul Batista on 24.1.18.
//

import Foundation
import Reactant
import UIKit
import RxSwift

enum GameActions {
    case difficultyButtonTapped(Int)
    case startButtonTapped
    case resultButtonTapped(Bool)
}

enum GameState {
    case pickingDifficulty
    case waitingToStart(difficulty: Int, word: String)
    case countingDown(difficulty: Int, word: String, remainingSeconds: Int)
}

struct GameRootViewState {
    var rounds: Int
    var state: GameState
}

final class GameRootView: ViewBase<GameRootViewState, GameActions> {
    let name = UILabel()
    let wordLabel = UILabel()
    let actualActivity = UILabel()
    let button3Points = UIButton()
    let button4Points = UIButton()
    let button5Points = UIButton()
    let correctButton = UIButton()
    let incorrectButton = UIButton()
    let timer = UILabel()
    let startButton = UIButton()

    private let team: Team
    private let activity: String

    override var actions: [Observable<GameActions>] {
        return [
            button3Points.rx.tap.rewrite(with: 3).map(GameActions.difficultyButtonTapped),
            button4Points.rx.tap.rewrite(with: 4).map(GameActions.difficultyButtonTapped),
            button5Points.rx.tap.rewrite(with: 5).map(GameActions.difficultyButtonTapped),
            startButton.rx.tap.rewrite(with: GameActions.startButtonTapped),
            correctButton.rx.tap.rewrite(with: true).map(GameActions.resultButtonTapped),
            incorrectButton.rx.tap.rewrite(with: false).map(GameActions.resultButtonTapped),
        ]
    }

    init(team: Team, activity: String) {
        self.team = team
        self.activity = activity
        super.init()
    }

    override func update() {
        let state = componentState

        name.text = team.name

        switch state.state {
        case .pickingDifficulty:
            wordLabel.visibility = .collapsed
            button3Points.visibility = .visible
            button4Points.visibility = .visible
            button5Points.visibility = .visible
            startButton.visibility = .collapsed
            correctButton.visibility = .collapsed
            incorrectButton.visibility = .collapsed
        case .waitingToStart(_, let word):
            wordLabel.visibility = .visible
            button3Points.visibility = .collapsed
            button4Points.visibility = .collapsed
            button5Points.visibility = .collapsed
            startButton.visibility = .visible
            wordLabel.text = word
        case .countingDown(_, let word, let time):
            startButton.visibility = .collapsed
            correctButton.visibility = .visible
            incorrectButton.visibility = .visible
            timer.text = String(time)
            wordLabel.text = word
        }
    }

    override func loadView() {
        actualActivity.text = activity
    }
}
