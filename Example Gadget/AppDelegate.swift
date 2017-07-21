//
//  AppDelegate.swift
//  Example Gadget
//
//  Created by Jon Worms on 7/21/17.
//  Copyright © 2017 Jon Worms. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


	override init() {
		// Keep prevent gadget from showing a dock icon or menu bar
		NSApplication.shared().setActivationPolicy(.accessory)
		super.init()
	}
	

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}


}

