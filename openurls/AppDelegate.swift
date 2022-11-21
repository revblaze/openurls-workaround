//
//  AppDelegate.swift
//  openurls
//
//  Created by Justin Bush on 11/21/22.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

  /// Handles the opening of this application with any number of input files.
  ///
  /// Called regardless of the application's current status (opened/closed) and includes, but is not limited to, such states:
  ///  * From Finder, right-click input file, `Open With... > [this application]`
  ///  * Dragging and dropping an input file onto the application icon in dock
  func application(_ application: NSApplication, open urls: [URL]) {
    // Append each url to the inputFileQueue
    for url in urls {
      inputFileQueue.append(url.path)
    }
    /// If the application has already initialized, and ViewController.viewDidAppear, call function directly.
    /// Otherwise, let ViewController.didViewAppear handle function call (cannot init before this method; will crash).
    if mainViewHasAppeared {
      callQueueInputFiles()
    }
  }
  /// Array of input file paths, requested to be open with mainWindow ViewController if applicable
  var inputFileQueue: [String] = []
  /// Flag to determine if AppDelegate has already dispatched an input file queue to ViewController
  var didDispatchFileQueue = false
  /// Flag to determine if mainWindow ViewController has loaded to the point of accepting call requests
  var mainViewHasAppeared = false
  /// Call `queueInputFiles()` from mainWindow ViewController
  func callQueueInputFiles() {
    let mainWindow = NSApplication.shared.windows[0]
    let viewController = mainWindow.contentViewController as? ViewController
    viewController?.queueInputFiles()
    mainWindow.makeKeyAndOrderFront(self)
  }

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }

  func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }


}

