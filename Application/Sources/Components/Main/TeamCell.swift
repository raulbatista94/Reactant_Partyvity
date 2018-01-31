//
//  TeamCell.swift
//  Partyvity
//
//  Created by Raul Batista on 24.1.18.
//

import Foundation
import Reactant

final class TeamCell: ViewBase<Team, Void>, Reactant.TableViewCell {
    static let height: CGFloat = 70

    private let name = UILabel()
    private let score = UILabel()
    private let icon = UILabel()
    private let round = UILabel()


    override func update() {
        icon.text = "👥"
        name.text = componentState.name
        score.text = "Score: \(componentState.score)"
        round.text = "Round: \(componentState.rounds)"
    }

    func setHighlighted(_ highlighted: Bool, animated: Bool) {
        let style = { self.apply(style: highlighted ? Styles.highlightedBackground : Styles.normalBackground)}
        if animated {
            UIView.animate(withDuration: 0.8, animations: style)
        } else {
            style()
        }
    }
}

extension TeamCell.Styles {
    static func normalBackground(_ cell: TeamCell) {
        cell.backgroundColor = nil
    }

    static func highlightedBackground(_ cell: TeamCell) {
        cell.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
    }
}
