import Reactant
import RxSwift
import RxDataSources

enum MainAction {
    case tableViewAction(PlainTableViewAction<TeamCell>)
    case teamDeleted(Team)
}

final class MainRootView: ViewBase<[Team], MainAction> {
    let teamTableView = PlainTableView<TeamCell>(reloadable: false)

    override var actions: [Observable<MainAction>] {
        return [
            teamTableView.action.map(MainAction.tableViewAction),
            teamTableView.tableView.rx.itemDeleted
                .withLatestFrom(left: observableState).map { state, indexPath in state[indexPath.row] }
                .map(MainAction.teamDeleted)
        ]
    }

    override func update() {
        teamTableView.componentState = componentState.isEmpty ? .empty(message: "No teams created!") : .items(componentState)
    }

    override func loadView() {
        teamTableView.footerView = UIView()
        teamTableView.rowHeight = TeamCell.height
        teamTableView.separatorStyle = .singleLineEtched
    }
}

