//
//  ViewController+TextView.swift
//  openurls
//
//  Created by Justin Bush on 11/21/22.
//

import Cocoa

extension ViewController: NSTextViewDelegate {
  
  func initTextView() {
    textView.delegate = self
    textView.isEditable = false
  }
  
  func renderTextView() {
    textView.font = .monospacedSystemFont(ofSize: 11, weight: .medium)
    textView.textColor = .textColor
    textView.scrollToEndOfDocument(self)
  }
  
  func updateTextView() {
    let formatString = appDelegate.inputFileQueue.joined(separator: "\n")
    let text = NSAttributedString(string: formatString)
    textView.textStorage?.setAttributedString(text)
    renderTextView()
  }
  
}
