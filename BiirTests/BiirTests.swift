//
//  BiirTests.swift
//  BiirTests
//
//  Created by Frank on 01/03/2021.
//

import XCTest
import ComposableArchitecture
@testable import Biir

class BiirTests: XCTestCase {
    private let scheduler = DispatchQueue.testScheduler

    func test_reducer_next_page() {
        let store = TestStore(
            initialState: BeerListState(),
            reducer: beerListReducer,
            environment: BeerListEnvironment.mock(
                mainQueue: scheduler.eraseToAnyScheduler(),
                beerClient: .happyPath,
                beerListItemEnvironment: .happyPath(mainQueue: scheduler.eraseToAnyScheduler()))
        )

        store.assert(
            .send(.getNextPage) {
                $0.currentPage = 2
                $0.requestInFlight = true
            },
            .do { self.scheduler.advance() },
            .receive(.beersResponse(.success(
                BeersData(
                    currentPage: 1,
                    numberOfPages: 3,
                    totalResults: 0,
                    data: []
                )
            ))) {
                $0.lastPage = 3
                $0.requestInFlight = false
            }
        )
    }
}
