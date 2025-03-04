//
//  CodeEditorView.swift
//  __C++IDE__
//
//  Created by  Sadi on 04/03/2025.
//

import SwiftUI

struct CodeEditorView: UIViewRepresentable {
    
    @Binding var code: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: CodeEditorView
        
        init(parent: CodeEditorView) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.code = textView.text
        }
    }
    
    // Make the UITextView
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont.monospacedSystemFont(ofSize: 18, weight: .regular)
        textView.textColor = .white
        textView.backgroundColor = .black
        textView.delegate = context.coordinator
        return textView
    }
    
    // Update the UITextView
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = code
    }
    
}
