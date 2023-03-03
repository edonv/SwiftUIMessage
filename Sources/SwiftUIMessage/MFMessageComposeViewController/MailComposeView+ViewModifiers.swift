//
//  MailComposeView+ViewModifiers.swift
//  
//
//  Created by Edon Valdman on 3/2/23.
//

import SwiftUI

extension View where Self == MailComposeView {
    /// Disables the camera/attachment button in the message composition view.
    ///
    /// In iOS 7.0 and later, call this method to disable the camera/attachment button in the message composition view.
    func disableUserAttachments(_ disable: Bool = true) -> MailComposeView {
        var newView = self
        newView.disableUserAttachments = disable
        return newView
    }
}

