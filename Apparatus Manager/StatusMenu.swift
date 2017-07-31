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
	
	private var layoutMode: Bool = false
	
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
		
		let refreshItem = NSMenuItem(title: "Refresh", action: #selector(sendRefresh), keyEquivalent: "")
		refreshItem.target = self
		self.addItem(refreshItem)
		
		
		self.addItem(NSMenuItem.separator())
		self.addItem(NSMenuItem(title: "Quit", action: nil, keyEquivalent: ""))
		
		//NSWorkspace.shared().launchApplication(withBundleIdentifier: "", options: .async, additionalEventParamDescriptor: nil, launchIdentifier: nil)
		//notificationCenter.addObserver(self, selector: #selector(receivedLaunchNotification), name: ApparatusNotifiationName.widgetLaunched, object: nil)
		
		AddApparatusObserver(observer: self, selector: #selector(receivedLaunchNotification), name: .widgetLaunched)
		
		
	}
	
	

	
	func sendRefresh() {
		print("broadcasting refresh signal")
		PostApparatusNotification(name: .refresh)
	}
	
	
	func enableLayoutMode() {
		layoutMode = true
		layoutMenuItem.title = "Exit Layout Mode"
		layoutMenuItem.action = #selector(disableLayoutMode)
		PostApparatusNotification(name: .managerEnabledLayoutMode);
	}
	
	
	func disableLayoutMode() {
		layoutMode = false
		layoutMenuItem.title = "Enter Layout Mode"
		layoutMenuItem.action = #selector(enableLayoutMode)
		PostApparatusNotification(name: .managerDisabledLayoutMode)
	}

	
	func receivedLaunchNotification(notification: Notification) {
		print("received launch notification")
		if(layoutMode) {
			enableLayoutMode()
		} else {
			disableLayoutMode()
		}
	}
	
}


extension NSWorkspace {
	func launchApplication(withBundleIdentifier bundleId: String) {
		self.launchApplication(withBundleIdentifier: bundleId, options: .async, additionalEventParamDescriptor: nil, launchIdentifier: nil)
	}
}


