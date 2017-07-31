//
//  WidgetNotificationCenter.swift
//  Widget
//
//  Created by Jon Worms on 7/21/17.
//  Copyright © 2017 Jon Worms. All rights reserved.
//

import Cocoa



public enum ApparatusNotificationName: String {
	case managerClosed = "WidgetManagerClosed"
	case widgetLaunched = "WidgetLaunched"
	case widgetClosed = "WidgetClosed"
	case managerEnabledLayoutMode = "WidgetEnableLayoutMode"
	case managerDisabledLayoutMode = "WidgetDisableLayoutMode"
	case refresh = "WidgetRefreshSignal"
}

public enum ApparatusNotificationInfoKey: UInt8 {
	case layoutModeEnabled = 0
}


public func AddApparatusObserver(observer: Any, selector: Selector, name: ApparatusNotificationName, object: String? = nil) {
	DistributedNotificationCenter.default().addObserver(observer, selector: selector, name: Notification.Name(rawValue: name.rawValue), object: object, suspensionBehavior: .deliverImmediately)
}


public func PostApparatusNotification(name: ApparatusNotificationName, userInfo: [ApparatusNotificationInfoKey: Any]? = nil) {
	DistributedNotificationCenter.default().postNotificationName(Notification.Name(rawValue: name.rawValue), object: nil, userInfo: userInfo, deliverImmediately: true)
}
