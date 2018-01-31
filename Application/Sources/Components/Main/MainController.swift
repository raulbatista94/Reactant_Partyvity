import Reactant
import RxSwift

final class MainController: ControllerBase<Void, MainRootView> {
    struct Dependencies {
        let teamService: TeamService
    }
    struct Reactions {
        let teamSelected: (Team) -> Void
        let createTeamTapped: () -> Observable<String?>
    }

    private let dependencies: Dependencies
    private let reactions: Reactions

    private let addTeam = UIBarButtonItem(title: "Add Team", style: .plain)

    init(dependencies: Dependencies, reactions: Reactions) {
        self.dependencies = dependencies
        self.reactions = reactions

        super.init(title: "Partyvity")
    }

    override func afterInit() {
        navigationItem.rightBarButtonItem = addTeam
        addTeam.rx.tap
            .flatMapLatest { [reactions] in
                reactions.createTeamTapped()
            }
            .subscribe(onNext: { [unowned self] teamName in
                guard let teamName = teamName else { return }

                _ = self.dependencies.teamService.createTeam(named: teamName)
                self.invalidate()
            })
            .disposed(by: lifetimeDisposeBag)
    }

    override func update() {
        let teams = dependencies.teamService.teams()

        rootView.componentState = teams
    }

    override func act(on action: MainAction) {
        switch action {
        case .tableViewAction(.selected(let team)):
            reactions.teamSelected(team)
        case .teamDeleted(let team):
            dependencies.teamService.delete(team: team)
            invalidate()
        default:
            break
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        invalidate()
    }
}
