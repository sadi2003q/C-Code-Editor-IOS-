//
//  ContentView.swift
//  __C++IDE__
//
//  Created by  Sadi on 04/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var code = """
// Write C++ code here\n#include <iostream>\nint main() {\n    std::cout << \"Hello!\";\n}
"""
    
    @State private var output = "Output will be shown here"
    
    
    var body: some View {
        VStack {
            
            TextEditor_Code
            
            View_ShowOutput
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button_Run
                
                Button_Magic
            }
            
        }
    }
    
    
    /// Code Editor Canvas
    private var TextEditor_Code: some View {
        CodeEditorView(code: $code)
            .frame(height: UIScreen.main.bounds.height * 0.7)
    }
    
    /// Output Section of the Code
    private var View_ShowOutput: some View {
        Text(output)
            .font(.system(size: 14, design: .monospaced))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(.gray.opacity(0.8))
            .foregroundStyle(.white)
    }
    
    /// Run Button of the Code
    private var Button_Run: some View {
        Button("Run", systemImage: "play") {
            output="Running..."
        }
    }
    
    /// Magic Button of the Code
    private var Button_Magic: some View {
        Button("Code Magic") {
            code += "\n //Magic Added"
        }
    }
}

#Preview {
    ContentView()
}
