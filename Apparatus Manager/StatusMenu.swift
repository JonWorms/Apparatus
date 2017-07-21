//
//  StatusMenu.swift
//  Widget
//
//  Created by Jon Worms on 7/20/17.
//  Copyright © 2017 Jon Worms. All rights reserved.
//

import Cocoa
import Apparatus


class StatusMenu : NSMenu {
	
	
	private let notificationCenter: DistributedNotificationCenter = DistributedNotificationCenter.default()
	private var layoutMenuItem: NSMenuItem!
	
	init() {
		super.init(title: "Widget Manager")
		setup()
	}
	required init(coder decoder: NSCoder) { fatalError("init(coder)") }
	
	
	
	
	private func setup() {
	
		self.addItem(NSMenuItem(title: "About", action: nil, keyEquivalent: ""))
		layoutMenuItem = NSMenuItem(title: "Enter Layout Mode", action: #selector(enableLayoutMode), keyEquivalent: "")
		layoutMenuItem.target = self
		self.addItem(layoutMenuItem)
		
		self.addItem(NSMenuItem.separator())
		self.addItem(NSMenuItem(title: "Quit", action: nil, keyEquivalent: ""))
		
		NSWorkspace.shared().launchApplication(withBundleIdentifier: "", options: .async, additionalEventParamDescriptor: nil, launchIdentifier: nil)
		notificationCenter.addObserver(self, selector: #selector(widgetLaunched), name: ApparatusNotifiationName.widgetLaunched, object: nil)
		
		
		
		
	}
	
	
	func widgetLaunched(notification: NSNotification) {
		guard let infoDict: [String: AnyObject] = notification.object as? [String: AnyObject] else { return }
		
	}
	
	
	func enableLayoutMode() {
		layoutMenuItem.title = "Exit Layout Mode"
		layoutMenuItem.action = #selector(disableLayoutMode)
		notificationCenter.post(name: ApparatusNotifiationName.widgetEnableLayoutMode, object: nil)
	}
	
	
	func disableLayoutMode() {
		layoutMenuItem.title = "Enter Layout Mode"
		layoutMenuItem.action = #selector(enableLayoutMode)
		notificationCenter.post(name: ApparatusNotifiationName.widgetDisableLayoutMode, object: nil)
	}

}


extension NSWorkspace {
	func launchApplication(withBundleIdentifier bundleId: String) {
		self.launchApplication(withBundleIdentifier: bundleId, options: .async, additionalEventParamDescriptor: nil, launchIdentifier: nil)
	}
}


