//
//  Beer.swift
//  Biir
//
//  Created by Frank on 02/03/2021.
//

import Foundation

struct BeerDataLabels: Decodable, Equatable {
    var icon: String?
    var large: String?
}

struct BeerDataCategory: Decodable, Equatable {
    var name: String?
}

struct BeerDataStyle: Decodable, Equatable {
    var category: BeerDataCategory?
    var description: String?
}

struct BeerData: Decodable, Equatable {
    var id: String
    var name: String
    var abv: String?
    var ibu: String?
    var style: BeerDataStyle?
    var labels: BeerDataLabels?
}

struct BeersData: Decodable, Equatable {
    var currentPage: Int
    var numberOfPages: Int
    var totalResults: Int
    var data: [BeerData]
}
