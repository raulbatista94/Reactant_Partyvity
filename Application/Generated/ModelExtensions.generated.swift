// MARK: - Torch entity extensions generated from file: Application/Sources/Models/Team.swift at 2018-02-01 10:21:23 +0000

import Torch
import RealmSwift

internal extension Team {
    internal static let id = Torch.Property<Team, Int?>(name: "id")
    internal static let name = Torch.Property<Team, String>(name: "torch_name")
    internal static let score = Torch.Property<Team, Int>(name: "torch_score")
    internal static let rounds = Torch.Property<Team, Int>(name: "torch_rounds")
    internal static let timeStamp = Torch.Property<Team, Date>(name: "torch_timeStamp")

    internal init(fromManagedObject object: Torch_Team) {
        id = Torch.Utils.toValue(object.id)
        name = Torch.Utils.toValue(object.torch_name)
        score = Torch.Utils.toValue(object.torch_score)
        rounds = Torch.Utils.toValue(object.torch_rounds)
        timeStamp = Torch.Utils.toValue(object.torch_timeStamp)
    }

    internal mutating func torch_update(managedObject object: Torch_Team, database: Torch.Database) {
        Torch.Utils.updateManagedValue(&object.torch_name, name)
        Torch.Utils.updateManagedValue(&object.torch_score, score)
        Torch.Utils.updateManagedValue(&object.torch_rounds, rounds)
        Torch.Utils.updateManagedValue(&object.torch_timeStamp, timeStamp)
    }

    internal static func torch_delete(managedObject object: Torch_Team, deleteFunction: (RealmSwift.Object) -> Void) {
    }
}

internal class Torch_Team: RealmSwift.Object, Torch.ManagedObject {
    @objc internal dynamic var id = Int()
    @objc internal dynamic var torch_name = String()
    @objc internal dynamic var torch_score = Int()
    @objc internal dynamic var torch_rounds = Int()
    @objc internal dynamic var torch_timeStamp = Date()

    internal override static func primaryKey() -> String? {
        return "id"
    }
}
