//
//  ContentView.swift
//  __C++IDE__
//
//  Created by  Sadi on 04/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var code = "//write your code here"
    
    @State private var output = "Output will be shown here"
    
    
    var body: some View {
        VStack {
            
            TextEditor_Code
            
            View_ShowOutput
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button_Run
            }
        }
    }
    
    
    private var TextEditor_Code: some View {
        TextEditor(text: $code)
            .font(.system(size: 18, design: .monospaced))
            .frame(height: UIScreen.main.bounds.height*0.7)
            .background(Color.black)
            .foregroundStyle(.white)
    }
    
    private var View_ShowOutput: some View {
        Text(output)
            .font(.system(size: 14, design: .monospaced))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(.gray.opacity(0.8))
            .foregroundStyle(.white)
    }
    
    private var Button_Run: some View {
        Button("Run", systemImage: "play") {
            output="Running..."
        }
    }
}

#Preview {
    ContentView()
}
