//
//  BeerListView.swift
//  Biir
//
//  Created by Frank on 04/03/2021.
//

import SwiftUI
import ComposableArchitecture

struct BeerListView: View {
    var store: Store<BeerListState, BeerListAction> = Store(initialState: BeerListState(), reducer: beerListReducer, environment: .live)

    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationView {
                VStack {
                    if viewStore.requestInFlight {
                        Text("Loading...")
                            .font(.title)
                    } else {
                        List {
                            ForEachStore(self.store.scope(
                                state: { $0.beerList },
                                action: BeerListAction.beer(index:action:)
                            ),
                            id: \.id,
                            content: BeerListItem.init(store:)
                            )
                        }
                        .onAppear{
                            viewStore.send(.onAppear)
                        }
                        .listStyle(InsetGroupedListStyle())
                        
                    }
                }
                .navigationTitle(Text("Biir List"))
                .navigationBarItems(
                    leading: HStack {
                        if viewStore.currentPage > 1 {
                            Text("< Page \(viewStore.currentPage - 1)")
                                .onTapGesture {
                                    viewStore.send(.getPreviousPage)
                                }
                        }
                    },
                    trailing: HStack {
                        if viewStore.currentPage < viewStore.lastPage {
                            Text("Page \(viewStore.currentPage + 1) >")
                                .onTapGesture {
                                    viewStore.send(.getNextPage)
                                }
                        }
                    }
                )
            }
        }
    }
}
