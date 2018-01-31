protocol DependencyModule {
    var activityService: ActivityService { get }

    var teamService: TeamService { get }

    var counterService: CounterService { get }
}
