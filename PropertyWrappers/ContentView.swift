//
//  ContentView.swift
//  PropertyWrappers
//
//  Created by Taemin Yun on 6/9/25.
//

import SwiftUI

struct SNumber {
    var number: Int
}

class CNumber: ObservableObject {
    @Published private(set) var number: Int
    
    init(number: Int) {
        self.number = number
    }
    
    func increase() {
        number += 1
    }
}

struct Subview1: View {
    @Binding var number2: SNumber
    
    var body: some View {
        VStack {
            Text("\(number2.number)")
            Button {
                number2.number += 1
            } label: {
                Text("Plus2")
            }
            Spacer().frame(height: 40)
        }
    }
}

struct Subview2: View {
    @ObservedObject var number3: CNumber
    @ObservedObject var number4: CNumber
    @StateObject var number5: CNumber = CNumber(number: 5000)
 
    var body: some View {
        VStack {
            Text("\(number3.number)")
            Button {
                number3.increase()
            } label: {
                Text("Plus3")
            }
            Spacer().frame(height: 40)
            Text("\(number4.number)")
            Button {
                number4.increase()
            } label: {
                Text("Plus4")
            }
            Spacer().frame(height: 40)
            Text("\(number5.number)")
            Button {
                number5.increase()
            } label: {
                Text("Plus5")
            }
            Spacer().frame(height: 40)
        }
    }
}

struct Subview3: View {
    var body: some View {
        Subview4()
    }
}

struct Subview4: View {
    @EnvironmentObject var number6: CNumber
    
    var body: some View {
        Text("\(number6.number)")
        Button {
            number6.increase()
        } label: {
            Text("Plus6")
        }
        Spacer().frame(height: 40)
    }
}

struct ContentView: View {
    @State var number1: SNumber
    @State var number2: SNumber
    @ObservedObject var number4: CNumber
    @ObservedObject var number6: CNumber
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        VStack {
            Text("\(number1.number)")
            Button {
                number1.number += 1
            } label: {
                Text("Plus1")
            }
            Spacer().frame(height: 40)
            
            Subview1(number2: $number2)
            Subview2(
                number3: CNumber(number: 3000),
                number4: number4
            )
            Subview3()
                .environmentObject(number6)
        }
        .padding()
        .background(colorScheme == .dark ? .yellow : .green)
    }
}

#Preview {
    ContentView(
        number1: SNumber(number: 1000),
        number2: SNumber(number: 2000),
        number4: CNumber(number: 3000),
        number6: CNumber(number: 6000)
    )
}
