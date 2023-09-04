//
//  PermissionsView.swift
//  Showcase
//
//  Created by Anatoli Petrosyants on 04.09.23.
//

import SwiftUI
import ComposableArchitecture

// MARK: - PermissionsView

struct PermissionsView {
    let store: StoreOf<PermissionsReducer>
}

// MARK: - Views

extension PermissionsView: View {
    
    var body: some View {
        content.onAppear { self.store.send(.onViewAppear) }
    }
    
    @ViewBuilder private var content: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Text("Permissions")
        }
    }
}
