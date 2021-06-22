//
//  ContentView.swift
//  Shared
//
//  Created by Paul Spencer on 6/22/21.
//

import SwiftUI

struct ContentView: View {
    @State private var language = ""
    @State private var input_text = ""
    
    
    private func update_lang() {
        do {
            language = try model.prediction(text: input_text).label
        }
        catch {
            print("Failed")
        }
    }

    let model = CodeClassifier()
    var body: some View {
        VStack {
            TextField("Enter code", text: $input_text)
                .padding()
            Button {
                update_lang()
            } label: {
                Text("Check")
            }
            .buttonStyle(DefaultButtonStyle())
            Text(language)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
