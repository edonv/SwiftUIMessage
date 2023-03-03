//
//  NotificationName+Extensions.swift
//  SwiftUIMessage
//
//  Created by Edon Valdman on 3/2/23.
//

import Foundation

extension Notification.Name {
    /// Posted when a ``MessageComposeView`` completes and closes.
    ///
    /// Upon receiving this notification, query its `userInfo` dictionary with the ``MessageComposeView/DidFinishResultKey`` key. It will be of [MessageComposeResult](https://developer.apple.com/documentation/messageui/messagecomposeresult) type.
    public static let MessageComposeViewDidFinish = Notification.Name("SwiftUIMessage.MessageComposeViewDidFinish")
    
    /// Posted when a ``MailComposeView`` completes and closes.
    ///
    /// Upon receiving this notification, query its `userInfo` dictionary with the ``MailComposeView/DidFinishResultKey`` and ``MailComposeView/DidFinishErrorKey`` keys. They will be of [MessageComposeResult](https://developer.apple.com/documentation/messageui/messagecomposeresult) and `Error?` types.
    public static let MailComposeViewDidFinish = Notification.Name("SwiftUIMessage.MailComposeViewDidFinish")
}
