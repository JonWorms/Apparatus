//
//  WDWindow.swift
//  Widget
//
//  Created by Jon Worms on 7/20/17.
//  Copyright © 2017 Jon Worms. All rights reserved.
//

import Cocoa


let ApparatusWindowLevel: Int = Int(CGWindowLevelForKey(CGWindowLevelKey.desktopIconWindow))+1

class ApparatusWindow: NSWindow {
	

	override var hasShadow: Bool {
		set { /* nope */ }
		get { return false}
	}
	
	override var isOpaque: Bool {
		set { /* nope */ }
		get { return false }
	}
	
	
	override var canHide: Bool {
		set { /* nope */ }
		get { return false }
	}
	
	
	/*
	override var canBecomeMain: Bool {
		return false
	}
	
	
	override var canBecomeKey: Bool {
		return false
	}
	
	override var isKeyWindow: Bool {
		return false
	}
	*/
	
	
	
	override var backgroundColor: NSColor! {
		set {
			if(newValue.alphaComponent == 0) {
				super.backgroundColor = NSColor.black.withAlphaComponent(0.01)
			} else {
				super.backgroundColor = newValue
			}
		}
		get {
			return super.backgroundColor
		}
	}
	
	
	private var refreshTimer: Timer!
	
	override init(contentRect: NSRect, styleMask style: NSWindowStyleMask, backing bufferingType: NSBackingStoreType, defer flag: Bool) {
		super.init(contentRect: contentRect, styleMask: .borderless, backing: bufferingType, defer: flag)
		
		self.collectionBehavior = .stationary
		self.backgroundColor = NSColor.black.withAlphaComponent(0.01)
		// set level just above desktop icons
		self.level = ApparatusWindowLevel
		self.isMovableByWindowBackground = true
		
		
		//windowController?.shouldCascadeWindows = false
		//setFrameAutosaveName(representedFilename)
		//windowController?.windowFrameAutosaveName = representedFilename
		/*refreshTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true, block: {(t:Timer)->Void in
			NSLog("\(self.frame.origin), visible: \(self.isVisible)")
		})*/
		connectToManager()
		
		//self.setFrameAutosaveName("Layout")
		//self.orderFrontRegardless()
		//setFrameUsingName("Layout")
		
	}
	
	deinit {
		DistributedNotificationCenter.default().removeObserver(self)
	}
	
	
	private func connectToManager() {
		// subscribe to messages
		AddApparatusObserver(observer: self, selector: #selector(enableLayoutMode), name: .managerEnabledLayoutMode)
		AddApparatusObserver(observer: self, selector: #selector(disableLayoutMode), name: .managerDisabledLayoutMode)
		//AddApparatusObserver(observer: self, selector: #selector(refresh), name: .refresh)
		PostApparatusNotification(name: .widgetLaunched)
	}
	
	
	func enableLayoutMode() {
		NSLog("Entering layout mode")
		DispatchQueue.main.async {
			self.isMovableByWindowBackground = true
		}
	}
	
	func disableLayoutMode() {
		NSLog("Exiting layout mode")
		//saveFrame(usingName: "Layout")
		//saveFrame(usingName: "Layout")
		DispatchQueue.main.async {
			self.isMovableByWindowBackground = false
		}
	}
	
	
	
	
	// called periodically by the manager program to make sure gadgets are at the proper window level. 
	// - Sometimes the desktop does not want to play nice
	/*
	func refresh() {
		DispatchQueue.main.async {
			NSLog("\(self.isVisible)")
			if(!self.isVisible) {
				self.orderFrontRegardless()
			}
			
		}
	}
	*/
	
	
	
}
