//
//  BeerView.swift
//  Biir
//
//  Created by Frank on 03/03/2021.
//

import SwiftUI
import ComposableArchitecture

struct BeerView: View {
    var store: Store<Beer, BeerAction>

    init(store: Store<Beer, BeerAction>) {
        self.store = store
    }

    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                if (viewStore.largeIcon != nil) {
                    Image(uiImage: viewStore.largeIcon!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: UIScreen.main.bounds.height / 4, alignment: .center)
                }

                VStack(alignment: .center, spacing: 10) {
                    Text(viewStore.name)
                        .font(.title)
                        .fontWeight(.heavy)

                    Text(viewStore.category ?? "")

                    if viewStore.alcohol != nil {
                        Text("Alcohol: \(viewStore.alcohol!)")
                    }

                    if viewStore.bitterness != nil {
                        Text("Bitterness: \(viewStore.bitterness!)")
                    }

                    if viewStore.description != nil {
                        Text(viewStore.description!)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding()

                Spacer()
            }
            .onAppear { viewStore.send(.fetchLargeIconImage) }
        }
    }
}
