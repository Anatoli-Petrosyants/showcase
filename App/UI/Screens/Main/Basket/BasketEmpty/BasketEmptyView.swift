//
//  BasketEmptyView.swift
//  Showcase
//
//  Created by Anatoli Petrosyants on 14.09.23.
//

import SwiftUI
import ComposableArchitecture

// MARK: - ReducerView

struct BasketEmptyView {
    let store: StoreOf<BasketEmptyReducer>
}

// MARK: - Views

extension BasketEmptyView: View {
    
    var body: some View {
        content
    }
    
    @ViewBuilder private var content: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: 24) {
                HStack {
                    LottieViewRepresentable(name: "onboarding_1",
                                            loopMode: .autoReverse,
                                            play:.constant(true))
                    .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Your Showcase basket is empty")
                            .font(.headline)

                        Button {
                            viewStore.send(.view(.onAddProductsButtonTap))
                        } label: {
                            Text("Add products")
                                .font(.headlineBold)
                                .foregroundColor(.black)
                                .underline()
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding([.leading, .trailing], 24)            
        }
    }
}
