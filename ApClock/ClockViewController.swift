//
//  ViewController.swift
//  ApClock
//
//  Created by Jon Worms on 7/21/17.
//  Copyright © 2017 Jon Worms. All rights reserved.
//

import Cocoa

extension DateFormatter {
	func hourString(from date: Date) -> String {
		self.dateFormat = "HH"
		return self.string(from: date)
	}
	
	func minuteString(from date: Date) -> String {
		self.dateFormat = "mm"
		return self.string(from: date)
	}
	
	func secondString(from date: Date) -> String {
		self.dateFormat = "ss"
		return self.string(from: date)
	}
	

	func todayString(from date: Date) -> String {
		self.dateFormat = "EEEE, MMM d"
		return self.string(from: date)
	}
	
	
}





class ClockViewController: NSViewController {


	@IBOutlet var hours: NSTextField!
	@IBOutlet var minutes: NSTextField!
	@IBOutlet var seconds: NSTextField!
	@IBOutlet var date: NSTextField!
	
	let textColor: NSColor = NSColor.white
	var showColons: Bool = true
	var timer: Timer!
	
	var formatter: DateFormatter = DateFormatter()
	var calendar: Calendar = Calendar(identifier: .gregorian)

	
	override func viewDidLoad() {
		super.viewDidLoad()

		hours.textColor   = textColor
		minutes.textColor = textColor
		seconds.textColor = textColor
		date.textColor    = textColor

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
		//self.view.window?.backgroundColor = NSColor.clear

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
		let date = Date()
		self.hours.stringValue   = self.formatter.hourString(from: date)
		self.minutes.stringValue = self.formatter.minuteString(from: date)
		self.seconds.stringValue = self.formatter.secondString(from: date)
		self.date.stringValue    = self.formatter.todayString(from: date)
	}
	
	
	

}

