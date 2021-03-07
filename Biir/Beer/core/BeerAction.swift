//
//  BeerAction.swift
//  Biir
//
//  Created by Frank on 07/03/2021.
//

import Foundation
import SwiftUI

enum BeerAction: Equatable {
    case fetchLargeIconImage
    case handleFetchBeerIconResponse(Result<UIImage, BeerClientError>)
}
