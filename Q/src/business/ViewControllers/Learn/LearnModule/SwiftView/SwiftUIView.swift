//
//  SwiftUIView.swift
//  Q
//
//  Created by XQ on 2023/11/28.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            TextFieldTest()
            NumericTextTest()
        }
    }
}

struct TextFieldTest: View {
    @State private var value1: String = ""
    @State private var value2: String = ""
    @State private var value3: String = ""
    
    var body: some View {
        VStack {
            TextField("DefaultTextFieldStyle", text: $value1)
                .textFieldStyle(DefaultTextFieldStyle())
                .padding()
            TextField("PlainTextFieldStyle", text: $value2)
                .textFieldStyle(PlainTextFieldStyle())
                .padding()
            TextField("RoundedBorderTextFieldStyle", text: $value3)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}

struct NumericTextTest: View {
    @State private var number: Int = 0

    var body: some View {
        VStack(spacing: 20) {
            Text("\(number)")
                .contentTransition(.numericText())
            Button {
                withAnimation {
                    number = .random(in: 0 ..< 200)
                }
            } label: {
                Text("随机")
            }
        }
        .font(.largeTitle)
    }
}

//#Preview {
//    SwiftUIView()
//}
