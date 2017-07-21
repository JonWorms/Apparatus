//
//  ViewController.swift
//  ApClock
//
//  Created by Jon Worms on 7/21/17.
//  Copyright © 2017 Jon Worms. All rights reserved.
//

import Cocoa

class ClockViewController: NSViewController {

	@IBOutlet var hours: NSTextField!
	@IBOutlet var minutes: NSTextField!
	@IBOutlet var seconds: NSTextField!
	
	@IBOutlet var leftColon: NSTextField!
	@IBOutlet var rightColon: NSTextField!
	
	let textColor: NSColor = NSColor.white
	var showColons: Bool = true
	var timer: Timer!
	
	var hourFormatter: DateFormatter = DateFormatter()
	var minuteFormatter: DateFormatter = DateFormatter()
	var secondFormatter: DateFormatter = DateFormatter()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		hours.textColor = textColor
		minutes.textColor = textColor
		seconds.textColor = textColor
		leftColon.textColor = textColor
		rightColon.textColor = textColor
		
		hourFormatter.dateFormat = "HH"
		minuteFormatter.dateFormat = "mm"
		secondFormatter.dateFormat = "ss"
		
		
		timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(t: Timer) in
		
			self.updateTime()
		})

		// Do any additional setup after loading the view.
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}

	override func viewWillAppear() {
		super.viewWillAppear()
	}
	
	override func viewDidAppear() {
		super.viewDidAppear()
		timer.fire()
	}
	
	override func viewWillDisappear() {
		super.viewWillDisappear()
	}
	
	func updateTime() {
		
		//OperationQueue.main.addOperation {
			self.leftColon.isHidden = self.showColons
			self.rightColon.isHidden = self.showColons
			self.showColons = !self.showColons
			
			let date = Date()
			self.hours.stringValue = self.hourFormatter.string(from: date)
			self.minutes.stringValue = self.minuteFormatter.string(from: date)
			self.seconds.stringValue = self.secondFormatter.string(from: date)
		//}
		

	}
	
	
	

}

