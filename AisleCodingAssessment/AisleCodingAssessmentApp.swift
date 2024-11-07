//
//  AisleCodingAssessmentApp.swift
//  AisleCodingAssessment
//
//  Created by Kartikeya Singh on 07/11/24.
//

import SwiftUI

@main
struct AisleCodingAssessmentApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                AuthenticationView().navigationBarHidden(true)
            }
        }
    }
}
