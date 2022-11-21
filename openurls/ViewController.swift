//
//  ViewController.swift
//  openurls
//
//  Created by Justin Bush on 11/21/22.
//

import Cocoa

class ViewController: NSViewController {

  let appDelegate = NSApplication.shared.delegate as! AppDelegate
  
  override func viewDidLoad() {
    super.viewDidLoad()

    initTextView()
  }
  
  override func viewDidAppear() {
    // Handles the opening of files on application launch after initial load (requires main thread)
    DispatchQueue.main.async {
      // If inputFileQueue is populated
      if self.appDelegate.inputFileQueue.count > 0 {
        self.queueInputFiles()  // Call queueInputFiles
      }
      // AppDelegate can now call queueInputFiles directly
      self.appDelegate.mainViewHasAppeared = true
    }
  }
  
  
  /// Begin queue of files opened with macOS CoreServices handling.
  func queueInputFiles() {
    // If AppDelegate has already initated queue session, ignore additional requests
    if appDelegate.didDispatchFileQueue == false {
      appDelegate.didDispatchFileQueue = true   // Is first session call, switch flag
      // After 0.3s has elapsed, initate import of file queue
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        self.updateTextView()
        self.appDelegate.inputFileQueue = []    // Empty openAppWithFilePaths
        self.appDelegate.didDispatchFileQueue = false
      }
    }
  }
  
  
  // MARK: UI Elements
  @IBOutlet weak var textView: NSTextView!
  var lastInputFileQueue: NSAttributedString?
  var isLog = true


}

