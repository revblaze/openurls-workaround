//
//  DebugExtensions.swift
//  openurls
//
//  Created by Justin Bush on 11/21/22.
//

import Cocoa

extension AppDelegate {
  
  func addToLog(_ urls: [URL]) {
    let d = Date()
    let df = DateFormatter()
    df.dateFormat = "H:mm:ss.SSSS"
    for url in urls {
      logInputFileQueue.append("[\(df.string(from: d))] \(url.path)")
    }
  }
  
  @IBAction func toggleLog(_ sender: Any) {
    let mainWindow = NSApplication.shared.windows[0]
    let viewController = mainWindow.contentViewController as? ViewController
    viewController?.toggleLog()
    mainWindow.makeKeyAndOrderFront(self)
  }
  
}


extension ViewController {
  
  func toggleLog() {
    if isLog {
      let formatString = appDelegate.logInputFileQueue.joined(separator: "\n")
      let text = NSAttributedString(string: formatString)
      textView.textStorage?.setAttributedString(text)
    } else {
      textView.textStorage?.setAttributedString(lastInputFileQueue!)
    }
    renderTextView()
    isLog = !isLog
  }
  
}
