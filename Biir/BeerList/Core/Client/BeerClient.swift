//
//  BeerClient.swift
//  Biir
//
//  Created by Frank on 02/03/2021.
//

import Foundation
import ComposableArchitecture
import SwiftUI

struct BeerClientError: Error, Equatable {}

struct BeerClient {
    var beers: (String) -> Effect<BeersData, BeerClientError>
    var fetchImageFromUrl: (String) -> Effect<UIImage, BeerClientError>

    static let live = BeerClient(
        beers: { page in
            var components = URLComponents(string: "https://sandbox-api.brewerydb.com/v2/beers")!

            components.queryItems = [
                URLQueryItem(name: "key", value: "dfe49ad1b2bfb70f76f4dda37cae6e59"),
                URLQueryItem(name: "p", value: page)
            ]

            return URLSession.shared.dataTaskPublisher(for: components.url!)
                .map { data, _ in data }
                .decode(type: BeersData.self, decoder: JSONDecoder())
                .mapError { error in
                    print(error)
                    return BeerClientError()
                }
                .eraseToEffect()
        },
        fetchImageFromUrl: { urlString in
            guard let url = URL(string: urlString) else {
                return .init(error: BeerClientError())
            }
            var data: Data? = nil

            return URLSession.shared.dataTaskPublisher(for: url)
                .map { data, _ in UIImage(data: data)! }
                .mapError { _ in BeerClientError() }
                .eraseToEffect()
        }
    )

    #if DEBUG
    static func mock(
        beers: @escaping (String) -> Effect<BeersData, BeerClientError>,
        fetchImageFromUrl: @escaping (String) -> Effect<UIImage, BeerClientError>
    ) -> Self {
        return BeerClient(
            beers: beers,
            fetchImageFromUrl: fetchImageFromUrl
        )
    }

    static let happyPath = BeerClient(
        beers: { _ in Effect.init(value: BeersData(currentPage: 1, numberOfPages: 3, totalResults: 0, data: []))},
        fetchImageFromUrl: { _ in Effect.init(value: UIImage())}
    )
    #endif
}
