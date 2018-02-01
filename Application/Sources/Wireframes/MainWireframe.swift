import UIKit
import Reactant
import RxSwift

final class MainWireframe: Wireframe {
    private let module: DependencyModule

    init(module: DependencyModule) {
        self.module = module
    }

    func entrypoint() -> UIViewController {
        let mainController = main()
        return UINavigationController(rootViewController: mainController)
    }

    private func main() -> MainController {
        return create { provider in
            let dependencies = MainController.Dependencies(
                teamService: module.teamService)
            let reactions = MainController.Reactions(
                teamSelected: { team in
                    provider.navigation?.push(controller: self.game(team: team))
                },
                createTeamTapped: {
                    let (controller, observable) = self.addUserAlert()
                    provider.controller?.present(controller: controller)
                    return observable
                })
            return MainController(dependencies: dependencies, reactions: reactions)
        }
    }

    private func youWin(name: String) -> UIAlertController {
        let alertVC = UIAlertController(
            title: "Team \(name) wins",
            message: "Your team already won and cant obtain more points",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)

        return alertVC
    }

    private func addUserAlert() -> (UIAlertController, Observable<String?>) {
        return create { provider, observer in
            let alertController = UIAlertController(title: "Add new team", message: "Enter the name of the new team", preferredStyle: .alert)

            alertController.addTextField(configurationHandler: nil)

            let addAction = UIAlertAction(title: "Add", style: .default, handler:{ _ in
                observer.onLast(alertController.textFields?.first?.text)
            })

            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel)

            alertController.addAction(addAction)
            alertController.addAction(cancelAction)

            return alertController
        }
    }

    private func game(team: Team) -> GameController {
        return create {provider in
            let dependencies = GameController.Dependencies(
                activityService: module.activityService,
                counterService: module.counterService,
                teamService: module.teamService)
            let properties = GameController.Properties(
                team: team,
                activity: module.activityService.randomActivity())
            let reactions = GameController.Reactions(
                endActivity: {
                    provider.navigation?.pop(animated: true)
                },
                alreadyWinner: {_ in
                    self.youWin(name: team.name)
                })
            return GameController(dependencies: dependencies, properties: properties, reactions: reactions)
                .with(state: (team.rounds, .pickingDifficulty))
        }
    }
}
