//
//  BeerListItemView.swift
//  Biir
//
//  Created by Frank on 03/03/2021.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct BeerListItem: View {
    let store: Store<Beer, BeerListItemAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationLink(
                destination: BeerView(
                    store: self.store.scope(
                        state: { $0 },
                        action: BeerListItemAction.beerViewAction
                    )
                )
            ) {
                HStack {
                    if (viewStore.icon != nil) {
                        Image(uiImage: viewStore.icon!)
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .center)
                    } else {
                        Text("Biir")
                            .fontWeight(.heavy)
                            .opacity(0.1)
                            .frame(width: 40, height: 40, alignment: .center)
                    }

                    VStack(alignment: .leading) {
                        Text(viewStore.name)
                            .fontWeight(.bold)

                        if viewStore.category != nil {
                            Text(viewStore.category!)
                                .font(.caption)
                        }
                    }
                }
                .onAppear {
                    viewStore.send(.fetchBeerIcon(viewStore.iconUrl))
                }
            }
        }
    }
}
