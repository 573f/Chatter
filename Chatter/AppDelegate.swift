//
//  AppDelegate.swift
//  Chatter
//
//  Created by Stephen Skubik-Peplaski on 9/22/15.
//  Copyright © 2015 Stephen Skubik-Peplaski. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var windowControllers: [ChatWindowController] = []
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        addWindowController()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    // MARK: - Actions
    
    @IBAction func displayNewWindow(sender: NSMenuItem) {
        addWindowController()
    }

    // MARK: - Helpers
    
    func addWindowController() {
        let windowController = ChatWindowController()
        windowController.showWindow(self)
        windowControllers.append(windowController)
    }

}

