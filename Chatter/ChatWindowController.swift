//
//  ChatWindowController.swift
//  Chatter
//
//  Created by Stephen Skubik-Peplaski on 9/22/15.
//  Copyright © 2015 Stephen Skubik-Peplaski. All rights reserved.
//

import Cocoa

class ChatWindowController: NSWindowController {
    
    dynamic var log: NSAttributedString = NSAttributedString(string: "")
    dynamic var message: String?

    @IBOutlet var textView: NSTextView!
    // MARK: - Lifecycle
    
    override var windowNibName: String {
        return "ChatWindowController"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    //MARK: - Actions
    
    @IBAction func send(sender: AnyObject) {
        print("Got \(message).")
    }
}
