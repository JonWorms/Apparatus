//
//  Main.swift
//  Apparatus
//
//  Created by Jon Worms on 7/21/17.
//  Copyright © 2017 Jon Worms. All rights reserved.
//

import Cocoa

let delegate = AppDelegate()
NSApplication.shared().delegate = delegate
NSApplication.shared().setActivationPolicy(.accessory) // hide icon from dock

// start run loop
let ret = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
