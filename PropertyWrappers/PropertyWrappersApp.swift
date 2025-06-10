//
//  PropertyWrappersApp.swift
//  PropertyWrappers
//
//  Created by Taemin Yun on 6/9/25.
//

import SwiftUI

@main
struct PropertyWrappersApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                number1: SNumber(number: 1000),
                number2: SNumber(number: 2000),
                number4: CNumber(number: 4000),
                number6: CNumber(number: 6000)
            )
        }
    }
}
