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
    
    public var settingsWindow: NSWindowController?
    var walletsViewController: WalletsViewController?
    var buttonsBarViewController: ButtonsBarViewController?


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        BitWake.ensureHaveApplicationSupportDirectory()
        
        self.setupMenu()
        self.setupSettingsWindow()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    private func setupMenu() {
        //self.statusItem.title = "BitWake"
        self.statusItem.menu = self.menu
        self.statusItem.image = NSImage(named: "ion-social-bitcoin")
        
        self.walletsViewController = WalletsViewController(nibName: "WalletsViewController", bundle: nil)
        let walletsMenuItem = NSMenuItem(title: "Custom view", action: nil, keyEquivalent: "")
        walletsMenuItem.view = walletsViewController?.view
        self.menu.insertItem(walletsMenuItem, at: 0)
        
        self.buttonsBarViewController = ButtonsBarViewController(nibName: "ButtonsBarViewController", bundle: nil)
        let buttonsBarMenuItem = NSMenuItem(title: "Custom view", action: nil, keyEquivalent: "")
        buttonsBarMenuItem.view = buttonsBarViewController?.view
        self.menu.insertItem(buttonsBarMenuItem, at: 1)
        
        // Using private method to remove top and bottom padding. Would be way better if we could do this without using this private method. Let's wait for High Sierra and see. TODO: Use public method if/when available
        self.menu._setHasPadding(false, on: .minY)
        self.menu._setHasPadding(false, on: .maxY)
    }
    
    private func setupSettingsWindow() {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        self.settingsWindow = storyboard.instantiateController(withIdentifier: "settingsWindow") as? NSWindowController
    }
    
    public func showSettingsWindow() {
        self.settingsWindow?.showWindow(self)
    }
}

