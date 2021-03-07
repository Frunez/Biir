//
//  beerReducer.swift
//  Biir
//
//  Created by Frank on 07/03/2021.
//

import Foundation
import ComposableArchitecture

var beerReducer = Reducer<Beer, BeerAction, BeerEnvironment> { state, action, environment in
    switch action {
    case .fetchLargeIconImage:
        guard let largeIconUrl = state.largeIconUrl else { return .none }
        return environment.beerClient.fetchImageFromUrl(largeIconUrl)
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(BeerAction.handleFetchBeerIconResponse)
            .eraseToEffect()

    case let .handleFetchBeerIconResponse(.success(uiImage)):
        state.largeIcon = uiImage
        return .none

    case .handleFetchBeerIconResponse(.failure(_)):
        return .none
    }
}
