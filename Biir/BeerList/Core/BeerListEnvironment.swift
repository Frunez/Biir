//
//  BiirAppEnvironment.swift
//  Biir
//
//  Created by Frank on 02/03/2021.
//

import Foundation
import ComposableArchitecture

struct BeerListError: Error {}

struct BeerListEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var beerClient: BeerClient
    var beerListItemEnvironment: BeerListItemEnvironment

    static let live = BeerListEnvironment(
        mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
        beerClient: .live,
        beerListItemEnvironment: .live
    )

    #if DEBUG
    static func mock(
        mainQueue: AnySchedulerOf<DispatchQueue>,
        beerClient: BeerClient,
        beerListItemEnvironment: BeerListItemEnvironment
    ) -> Self {
        return BeerListEnvironment(
            mainQueue: mainQueue,
            beerClient: beerClient,
            beerListItemEnvironment: beerListItemEnvironment
        )
    }

    static func happyPath(
        mainQueue: AnySchedulerOf<DispatchQueue>
    ) -> Self {
        return BeerListEnvironment(
            mainQueue: mainQueue,
            beerClient: .happyPath,
            beerListItemEnvironment: .happyPath(mainQueue: mainQueue)
        )
    }
    #endif
}
