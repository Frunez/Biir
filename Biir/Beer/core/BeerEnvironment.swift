//
//  BeerEnvironment.swift
//  Biir
//
//  Created by Frank on 07/03/2021.
//

import ComposableArchitecture

struct BeerEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var beerClient: BeerClient

    static let live = BeerEnvironment(
        mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
        beerClient: .live
    )

    #if DEBUG
    static func mock(
        mainQueue: AnySchedulerOf<DispatchQueue>,
        beerClient: BeerClient
    ) -> Self {
        return BeerEnvironment(
            mainQueue: mainQueue,
            beerClient: beerClient
        )
    }

    static func happyPath(
        mainQueue: AnySchedulerOf<DispatchQueue>
    ) -> Self {
        return BeerEnvironment(
            mainQueue: mainQueue,
            beerClient: .happyPath
        )
    }
    #endif
}
