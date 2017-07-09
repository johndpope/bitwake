//
//  AppDelegate.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-05-13.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    @IBOutlet weak var menu: NSMenu!
    @IBOutlet weak var quitItem: NSMenuItem!
    
    var settingsWindow: NSWindowController?
    var walletsViewController: WalletsViewController?


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        BitWake.ensureHaveApplicationSupportDirectory()
        
        self.setupMenu()
        
        self.settingsClicked(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func quitClicked(_ sender: Any) {
        NSApplication.shared().terminate(self)
    }
    
    @IBAction func settingsClicked(_ sender: Any) {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        
        self.settingsWindow = storyboard.instantiateController(withIdentifier: "settingsWindow") as? NSWindowController
        
        settingsWindow?.showWindow(self)
    }
    
    private func setupMenu() {
        self.statusItem.title = "BitWake"
        self.statusItem.menu = self.menu
        
        self.walletsViewController = WalletsViewController(nibName: "WalletsViewController", bundle: nil)
        let walletsMenuItem = NSMenuItem(title: "Custom view", action: nil, keyEquivalent: "")
        walletsMenuItem.view = walletsViewController?.view
        self.menu.insertItem(walletsMenuItem, at: 0)
        
        // Using private method to remove top and bottom padding. Would be way better if we could do this without using this private method. Let's wait for High Sierra and see. TODO: Use public method if/when available
        self.menu._setHasPadding(false, on: .minY)
        self.menu._setHasPadding(false, on: .maxY)
    }
}

