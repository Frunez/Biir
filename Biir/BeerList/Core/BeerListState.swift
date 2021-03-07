//
//  BiirAppStata.swift
//  Biir
//
//  Created by Frank on 02/03/2021.
//

import Foundation
import ComposableArchitecture

struct BeerListState: Equatable {
    var beerList: [Beer] = []
    var currentPage: Int = 1
    var lastPage: Int = 1
    var requestInFlight = false
}
