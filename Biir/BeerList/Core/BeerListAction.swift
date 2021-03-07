//
//  BiirAppAction.swift
//  Biir
//
//  Created by Frank on 02/03/2021.
//

import Foundation

enum BeerListAction: Equatable {
    case onAppear
    case getPreviousPage
    case getNextPage
    case beersResponse(Result<BeersData, BeerClientError>)
    case beer(index: Int, action: BeerListItemAction)
}
