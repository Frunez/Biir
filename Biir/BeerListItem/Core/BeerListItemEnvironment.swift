//
//  BeerListItemEnvironment.swift
//  Biir
//
//  Created by Frank on 03/03/2021.
//

import Foundation
import ComposableArchitecture
import SwiftUI

struct BeerListItemEnvironmentError: Error, Equatable {}

struct BeerListItemEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var beerClient: BeerClient
    var beerEnvironment: BeerEnvironment

    static let live = BeerListItemEnvironment(
        mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
        beerClient: .live,
        beerEnvironment: .live
    )

    #if DEBUG
    static func mock(
        mainQueue: AnySchedulerOf<DispatchQueue>,
        beerClient: BeerClient,
        beerEnvironment: BeerEnvironment
    ) -> Self {
        return BeerListItemEnvironment(
            mainQueue: mainQueue,
            beerClient: beerClient,
            beerEnvironment: beerEnvironment
        )
    }

    static func happyPath(
        mainQueue: AnySchedulerOf<DispatchQueue>
    ) -> Self {
        return BeerListItemEnvironment(
            mainQueue: mainQueue,
            beerClient: .happyPath,
            beerEnvironment: .happyPath(mainQueue: mainQueue)
        )
    }
    #endif
}
