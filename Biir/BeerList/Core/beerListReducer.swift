//
//  beerAppReducer.swift
//  Biir
//
//  Created by Frank on 02/03/2021.
//

import Foundation
import ComposableArchitecture

var beerListReducer = Reducer<BeerListState, BeerListAction, BeerListEnvironment>.combine(
    beerListItemReducer.forEach(
        state: \.beerList,
        action: /BeerListAction.beer(index:action:),
        environment: { _ in .live }
    ),
    localBeerListReducer
)

var localBeerListReducer = Reducer<BeerListState, BeerListAction, BeerListEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        if state.beerList.count > 0 {
            return .none
        }
        state.requestInFlight = true
        return environment.beerClient
            .beers(String(state.currentPage))
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(BeerListAction.beersResponse)

    case .getPreviousPage:
        if state.requestInFlight { return .none }
        state.requestInFlight = true
        state.currentPage -= 1
        return environment.beerClient
            .beers(String(state.currentPage))
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(BeerListAction.beersResponse)

    case .getNextPage:
        if state.requestInFlight { return .none }
        state.requestInFlight = true
        state.currentPage += 1
        return environment.beerClient
            .beers(String(state.currentPage))
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(BeerListAction.beersResponse)

    case let .beersResponse(.success(response)):
        state.requestInFlight = false
        state.lastPage = response.numberOfPages
        let beers = response.data.map { beerData -> Beer in
            var alcoholPercent: String? = (beerData.abv != nil) ? "\(beerData.abv!)%" : nil
            return Beer(
                id: beerData.id,
                name: beerData.name,
                alcohol: alcoholPercent,
                bitterness: calculateIBU(beerData.ibu),
                description: beerData.style?.description,
                category: beerData.style?.category?.name,
                iconUrl: beerData.labels?.icon,
                largeIconUrl: beerData.labels?.large
            )
        }
        state.beerList = beers
        return .none

    case .beersResponse(.failure(_)):
        state.requestInFlight = false
        state.beerList = []
        return .none

    case .beer(index: let index, action: let action):
        return .none
    }
}
