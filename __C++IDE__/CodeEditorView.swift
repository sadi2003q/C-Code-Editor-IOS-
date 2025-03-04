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
    
    /// Make the UITextView
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont.monospacedSystemFont(ofSize: 18, weight: .regular)
        textView.textColor = .white
        textView.backgroundColor = .black
        textView.delegate = context.coordinator
        return textView
    }
    
    /// Update the UITextView
    func updateUIView(_ uiView: UITextView, context: Context) {
        let attributedCode = highlightCode(code)
        uiView.attributedText = attributedCode
    }
    
    
    /// Simple Highlighting Function
    /*
    private func highlightCode(_ text: String) -> NSAttributedString {
        
        let attributeString = NSMutableAttributedString(
            string: code,
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont.monospacedSystemFont(ofSize: 22, weight: .regular) // Ensure monospaced font
            ]
        )
        
        // List of C++ keywords of color blue
        let keywords = [
            "int", "if", "return", "main", "main()", "void", "double", "float", "char", "bool",
            "while", "for", "do", "switch", "case", "default", "break", "continue",
            "class", "struct", "public", "private", "protected", "namespace", "using",
            "new", "delete", "try", "catch", "throw", "const", "static", "volatile",
            "extern", "register", "sizeof", "typedef", "template", "typename", "operator",
            "virtual", "override", "final", "friend", "inline", "this", "nullptr", "true",
            "false", "enum", "union", "constexpr", "static_cast", "reinterpret_cast",
            "dynamic_cast", "const_cast", "lambda", "auto"
        ]
        
        let words = code.components(separatedBy: .whitespaces) //check each word within code
        var currentPosition = 0
        
        
        for word in words {
            if keywords.contains(word) {
                let range = NSRange(location: currentPosition, length: word.count)
                attributeString.addAttribute(
                    .foregroundColor,
                    value: UIColor.blue,
                    range: range
                )
            }
            
            currentPosition += word.count + 1
        }
        
        
        
        
        return attributeString
    }
     */
    private func highlightCode(_ text: String) -> NSAttributedString {
        let attributeString = NSMutableAttributedString(
            string: text,
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont.monospacedSystemFont(ofSize: 18, weight: .regular) // Ensure monospaced font
            ]
        )

        let keywords = [
            "int", "if", "return", "main", "void", "double", "float", "char", "bool",
            "while", "for", "do", "switch", "case", "default", "break", "continue",
            "class", "struct", "public", "private", "protected", "namespace", "using",
            "new", "delete", "try", "catch", "throw", "const", "static", "volatile",
            "extern", "register", "sizeof", "typedef", "template", "typename", "operator",
            "virtual", "override", "final", "friend", "inline", "this", "nullptr", "true",
            "false", "enum", "union", "constexpr", "static_cast", "reinterpret_cast",
            "dynamic_cast", "const_cast", "lambda", "auto"
        ]
        
        let pattern = "\\b(" + keywords.joined(separator: "|") + ")\\b"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])

        let matches = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
        
        for match in matches {
            attributeString.addAttributes([
                .foregroundColor: UIColor.blue,
                .font: UIFont.monospacedSystemFont(ofSize: 18, weight: .regular)
            ], range: match.range)
        }

        return attributeString
    }
    
}
