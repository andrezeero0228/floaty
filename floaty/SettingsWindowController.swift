//
//  SettingsWindowController.swift
//  Floaty
//
//  Created by James Zaghini on 9/6/18.
//  Copyright © 2018 James Zaghini. All rights reserved.
//

import Cocoa

class SettingsViewController: NSViewController, NSTextFieldDelegate, Serviceable {

    @IBOutlet private(set) var homepageURLTextField: NSTextField!
    @IBOutlet private(set) var opacitySlider: NSSlider!

    var settings = Services.shared.settings

    override func viewDidLoad() {
        homepageURLTextField.stringValue = settings.homepageURLString
        opacitySlider.floatValue = Float(settings.windowOpacity)
    }

    override func controlTextDidEndEditing(_ aNotification: Notification) {
        if aNotification.object as? NSTextField == homepageURLTextField {
            settings.homepageURLString = homepageURLTextField.stringValue
        }
    }

    @IBAction func sliderChanged(_ sender: Any) {
        let slider = sender as? NSSlider
        let opacity = CGFloat(slider?.floatValue ?? 1)
        settings.windowOpacity = opacity
    }
}
