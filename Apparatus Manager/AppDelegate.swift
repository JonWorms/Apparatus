//
//  AppDelegate.swift
//  Apparatus Manager
//
//  Created by Jon Worms on 7/21/17.
//  Copyright © 2017 Jon Worms. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
	
	
	var statusItem: NSStatusItem!
	var statusMenu: NSMenu!
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
		statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
		statusMenu  = StatusMenu()
		//statusMenu.addItem(NSMenuItem(title: "Test", action: nil, keyEquivalent: ""))
		statusItem.menu = statusMenu
		
	}
	
	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
	
	
}

