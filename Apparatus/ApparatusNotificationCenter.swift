//
//  WidgetNotificationCenter.swift
//  Widget
//
//  Created by Jon Worms on 7/21/17.
//  Copyright © 2017 Jon Worms. All rights reserved.
//

import Cocoa

public struct ApparatusNotifiationName {
	public static let widgetManagerClosed: NSNotification.Name = NSNotification.Name(rawValue: "WidgetManagerClosed")
	public static let widgetLaunched: NSNotification.Name = NSNotification.Name(rawValue: "WidgetLaunched")
	public static let widgetEnableLayoutMode: NSNotification.Name = NSNotification.Name(rawValue: "WidgetEnableLayoutMode")
	public static let widgetDisableLayoutMode: NSNotification.Name = NSNotification.Name(rawValue: "WidgetDisableLayoutMode")
}
