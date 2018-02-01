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

        super.init(title: "Partivity")
    }

    override func afterInit() {
         //r(red: 103/255, green: 134/255, blue: 214/255)
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
        let color1 = UIColor(red: 106/255, green: 134/255, blue: 212/255, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = color1
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white

        invalidate()
    }
}
