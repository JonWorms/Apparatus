//
//  WDWindow.swift
//  Widget
//
//  Created by Jon Worms on 7/20/17.
//  Copyright © 2017 Jon Worms. All rights reserved.
//

import Cocoa



class ApparatusWindow: NSWindow {
	

	override var hasShadow: Bool {
		set { /* nope */ }
		get { return false}
	}
	
	override var isOpaque: Bool {
		set { /* nope */ }
		get { return false }
	}
	
	
	
	override var canBecomeMain: Bool {
		return false
	}
	
	
	override var canBecomeKey: Bool {
		return false
	}
	
	override var isKeyWindow: Bool {
		return false
	}
	

	
	override init(contentRect: NSRect, styleMask style: NSWindowStyleMask, backing bufferingType: NSBackingStoreType, defer flag: Bool) {
		super.init(contentRect: contentRect, styleMask: .borderless, backing: bufferingType, defer: false)
		
		
		// background color
		self.backgroundColor = NSColor.black.withAlphaComponent(0.5)
		
		self.collectionBehavior = .stationary
		
		// hide from expose
		//self.collectionBehavior.formUnion(.transient)
		//self.collectionBehavior.subtract(.participatesInCycle)
		//self.collectionBehavior.formUnion(.ignoresCycle)
		
		
		// set level just above desktop icons
		self.level = Int(CGWindowLevelForKey(CGWindowLevelKey.desktopIconWindow))+1
		
		self.isMovableByWindowBackground = true
		
		DistributedNotificationCenter.default().addObserver(self, selector: #selector(enableLayoutMode), name: ApparatusNotifiationName.widgetEnableLayoutMode, object: nil, suspensionBehavior: .deliverImmediately)
		
		DistributedNotificationCenter.default().addObserver(self, selector: #selector(disableLayoutMode), name: ApparatusNotifiationName.widgetDisableLayoutMode, object: nil, suspensionBehavior: .deliverImmediately)
		
		

	}
	
	
	
	func enableLayoutMode() {
		self.isMovableByWindowBackground = true		
		
	}
	
	func disableLayoutMode() {
		self.isMovableByWindowBackground = false
	}
	
	

	
	
	
	
}
