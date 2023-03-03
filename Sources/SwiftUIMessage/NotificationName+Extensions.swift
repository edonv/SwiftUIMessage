//
//  NotificationName+Extensions.swift
//  SwiftUIMessage
//
//  Created by Edon Valdman on 3/2/23.
//

import Foundation

extension Notification.Name {
    /// Posted when a ``MailComposeView`` completes and closes.
    ///
    /// Upon receiving this notification, query its userInfo dictionary with the ``MailComposeView/MCViewDidFinishResultKey`` key. It will be of [MessageComposeResult](https://developer.apple.com/documentation/messageui/messagecomposeresult) type.
    public static let MCViewDidFinish = Notification.Name("SwiftUIMessage.MCViewDidFinish")
}
