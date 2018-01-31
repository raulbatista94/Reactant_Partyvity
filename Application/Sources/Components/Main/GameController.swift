//
//  GameController.swift
//  Partyvity
//
//  Created by Raul Batista on 24.1.18.
//

import Foundation
import Reactant
import RxSwift

final class GameController: ControllerBase<(rounds: Int, gameState: GameState), GameRootView>{
    struct Dependencies {
        let activityService: ActivityService
        let counterService: CounterService
        let teamService: TeamService
    }
    struct Properties {
        var team: Team
        let activity: String
    }
    struct Reactions {
        let endActivity: () -> Void
        let alreadyWinner: (_ name: String) -> UIAlertController
    }

    private let dependencies: Dependencies
    private let properties: Properties
    private let reactions: Reactions

    init(dependencies: Dependencies, properties: Properties, reactions: Reactions) {
        self.dependencies = dependencies
        self.properties = properties
        self.reactions = reactions

        super.init(title: "Round: \(properties.team.rounds)", root: GameRootView(team: properties.team, activity: properties.activity))
    }

    override func update() {
        rootView.componentState = GameRootViewState(rounds: componentState.rounds, state: componentState.gameState)
    }

    override func act(on action: GameActions) {
        switch action {
        case .difficultyButtonTapped(let difficulty):
            var state = componentState
            let randomWord = dependencies.activityService.randomWord(difficulty: difficulty)
            state.gameState = .waitingToStart(difficulty: difficulty, word: randomWord)
            componentState = state
        case .startButtonTapped:
            var state = componentState
            guard case .waitingToStart(let difficulty, let word) = state.gameState else { return }
            state.rounds = dependencies.teamService.beginRound(id: properties.team.id) ?? 1
            componentState = state
            dependencies.counterService.startCounter()
                .subscribe(onNext: { [weak self] in
                    self?.componentState.gameState = .countingDown(difficulty: difficulty, word: word, remainingSeconds: $0)
                })
                .disposed(by: lifetimeDisposeBag)
        case .resultButtonTapped(let isCorrect):
            guard case .countingDown(let difficulty, _, _) = componentState.gameState else { return }
            if isCorrect {
                dependencies.teamService.correctAnswer(id: properties.team.id, difficulty: difficulty)
                if properties.team.score > 60 {
                    present(reactions.alreadyWinner(properties.team.name), animated: true)
                }
            }
            reactions.endActivity()
        }
    }
}
