import Torch

final class TeamService {

    private let database: Database

    init(database: Database) {
        self.database = database
    }

    func createTeam(named teamName: String) -> Team {           //Team creation and save
        var team = Team(
            id: nil,
            name: teamName,
            score: 0,
            rounds: 0,
            timeStamp: Date())

        database.create(&team)

        return team
    }

    func save(team: Team) {
        database.save(team)
    }

    func delete(team: Team) {
        database.delete(team)
    }

    func teams() -> [Team] {                                //Loadin teams
        return database.load(Team.self)
    }

    func correctAnswer(id: Int?, difficulty: Int) {
        guard var mutableTeam = team(id: id) else { return }
        if mutableTeam.score < 60 {
        mutableTeam.score += difficulty
        save(team: mutableTeam)
        }
    }

    func beginRound(id: Int?) -> Int? {
        guard var mutableTeam = team(id: id) else { return nil }
        mutableTeam.rounds += 1
        save(team: mutableTeam)
        return mutableTeam.rounds
    }

    func team(id: Int?) -> Team? {
        guard let teamId = id else { return nil }
        return teams().first { $0.id == teamId }
    }
}
