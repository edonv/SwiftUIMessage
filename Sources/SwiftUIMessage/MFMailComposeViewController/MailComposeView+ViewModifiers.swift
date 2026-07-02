//
//  MailComposeView+ViewModifiers.swift
//  
//
//  Created by Edon Valdman on 3/2/23.
//

import SwiftUI

extension View where Self == MailComposeView {
    /// Attaches the specified attachment(s) to the email.
    public func withAttachments(_ attachments: MailComposeView.AttachmentData...) -> MailComposeView {
        var newView = self
        newView.addAttachments(attachments)
        return newView
    }
    
    /// Attaches the specified attachment(s) to the email.
    public func withAttachments(_ attachments: [MailComposeView.AttachmentData]) -> MailComposeView {
        var newView = self
        newView.addAttachments(attachments)
        return newView
    }
}
