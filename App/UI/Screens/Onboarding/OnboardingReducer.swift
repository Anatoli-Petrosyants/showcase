//
//  OnboardingReducer.swift
//  Showcase
//
//  Created by Anatoli Petrosyants on 10.04.23.
//

import SwiftUI
import ComposableArchitecture

struct OnboardingReducer: Reducer {
    
    struct State: Equatable, Hashable {
        var items: [Onboarding] = Onboarding.pages
        var selectedTab: Onboarding.Tab = .page1
        var showGetStarted = false
    }
    
    enum Action: Equatable {
        enum Delegate {
            case didOnboardingFinished
        }
        
        case onGetStartedTapped
        case onTabChanged(tab: Onboarding.Tab)        
        case delegate(Delegate)
    }
    
    @Dependency(\.userDefaults) var userDefaults
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onGetStartedTapped:
                return .concatenate(
                    .send(.delegate(.didOnboardingFinished)),
                    .run { _ in
                        await self.userDefaults.setHasShownFirstLaunchOnboarding(true)
                    }
                )
                
            case let .onTabChanged(tab):
                state.selectedTab = tab
                state.showGetStarted = (tab == .page3)
                return .none
                
            case .delegate:
                return .none
            }
        }
    }
}

