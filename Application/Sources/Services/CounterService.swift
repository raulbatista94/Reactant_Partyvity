//
//  CounterService.swift
//  Partyvity
//
//  Created by Raul Batista on 25.1.18.
//

import RxSwift

final class CounterService {
    private static let timeLimit = 60

    func startCounter() -> Observable<Int> {
        return
            // Each second emit an event with the current index
            Observable<Int>.interval(1, scheduler: MainScheduler.instance) // [0, 1, 2, 3, 4, ..., +inf]

                // Let's start the sequence at 1 (offseting)
                .map { $0 + 1 } // [1, 2, 3, 4, 5, ..., +inf]

                // Only take 60 events
                .take(CounterService.timeLimit) // [1, 2, 3, 4, 5, ..., 59, 60]

                // Observable.interval emits first item after the first second, so we need to add our own event here
                .startWith(0) // [0, 1, 2, 3, 4, ..., 59, 60]

                // Subtract the current second from the total limit
                .map { CounterService.timeLimit - $0 } // [60, 59, 58, 57, ..., 1, 0]
    }
}
