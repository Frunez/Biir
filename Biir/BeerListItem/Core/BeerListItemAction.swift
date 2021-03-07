//
//  BeerListItemAction.swift
//  Biir
//
//  Created by Frank on 03/03/2021.
//

import Foundation
import ComposableArchitecture
import SwiftUI

enum BeerListItemAction: Equatable {
    case fetchBeerIcon(String?)
    case handleFetchBeerIconResponse(Result<UIImage, BeerClientError>)
    case beerViewAction(BeerAction)
}
