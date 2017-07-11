//
//  ButtonsBarViewController.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-07-11.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Cocoa

class ButtonsBarViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor(white: 0.295, alpha: 1.0).cgColor
    }
    
    @IBAction func clickedSettingsButton(_ sender: Any) {
        debugPrint("Settings")
    }
    
    @IBAction func clickedQuitButton(_ sender: Any) {
        debugPrint("Quit")
    }
}
