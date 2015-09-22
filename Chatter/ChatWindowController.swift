//
//  ChatWindowController.swift
//  Chatter
//
//  Created by Stephen Skubik-Peplaski on 9/22/15.
//  Copyright © 2015 Stephen Skubik-Peplaski. All rights reserved.
//

import Cocoa

private let ChatWindowControllerDidSendMessageNotification = "com.573f.chatter.ChatWindowControllerDidSendMessageNotification"
private let ChatWindowControllerMessageKey = "com.573f.chatter.ChatWindowControllerMessageKey"

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

        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(
            self,
            selector: Selector("receiveDidSendMessageNotification:"),
            name: ChatWindowControllerDidSendMessageNotification,
            object: nil)
    }
    
    deinit {
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.removeObserver(self)
    }
    
    // MARK: - Actions
    
    @IBAction func send(sender: NSButton) {
        sender.window?.endEditingFor(nil)
        if let message = message {
            let userInfo = [ChatWindowControllerMessageKey: message]
            let notificationCenter = NSNotificationCenter.defaultCenter()
            notificationCenter.postNotificationName(
                ChatWindowControllerDidSendMessageNotification,
                object: self,
                userInfo: userInfo)
        }
        message = ""
    }
    
    // MARK: - Notifications
    
    func receiveDidSendMessageNotification(note: NSNotification) {
        let mutableLog = log.mutableCopy() as! NSMutableAttributedString
        
        if log.length > 0 {
            mutableLog.appendAttributedString(NSAttributedString(string: "\n"))
        }
        
        let userInfo = note.userInfo! as! [String : String]
        let message = userInfo[ChatWindowControllerMessageKey]!
        
        let logLine = NSAttributedString(string: message)
        mutableLog.appendAttributedString(logLine)
        
        log = mutableLog.copy() as! NSAttributedString
        textView.scrollRangeToVisible(NSRange(location: log.length, length: 0))
    }
}
