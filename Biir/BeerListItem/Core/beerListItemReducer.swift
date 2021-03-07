//
//  beerListItemReducer.swift
//  Biir
//
//  Created by Frank on 03/03/2021.
//

import Foundation
import ComposableArchitecture

var beerListItemReducer = Reducer<Beer, BeerListItemAction, BeerListItemEnvironment>.combine(
    beerReducer.pullback(
        state: \Beer.self,
        action: /BeerListItemAction.beerViewAction,
        environment: { $0.beerEnvironment }
    ),
    localBeerListItemReducer
)

var localBeerListItemReducer = Reducer<Beer, BeerListItemAction, BeerListItemEnvironment> { state, action, environment in
    switch action {
    case let .fetchBeerIcon(urlString):
        guard let urlImageString = urlString else { return .none }
        return environment.beerClient.fetchImageFromUrl(urlImageString)
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(BeerListItemAction.handleFetchBeerIconResponse)
            .eraseToEffect()

    case let .handleFetchBeerIconResponse(.success(uiImage)):
        state.icon = uiImage
        return .none

    case .handleFetchBeerIconResponse(.failure(_)):
        return .none
        
    case .beerViewAction(_):
        return .none
    }
}
