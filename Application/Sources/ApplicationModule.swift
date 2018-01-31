import Torch

final class ApplicationModule: DependencyModule {
    let database: Database
    let activityService: ActivityService
    let teamService: TeamService
    let counterService: CounterService
    let decoder: JSONDecoder

    init() {
        database = try! Database()
        decoder = JSONDecoder()

        activityService = ActivityService()
        counterService = CounterService()
        teamService = TeamService(database: database)
    }
}
