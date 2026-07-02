//
//  MessageComposeView+ViewModifiers.swift
//  
//
//  Created by Edon Valdman on 3/2/23.
//

import SwiftUI

extension View where Self == MessageComposeView {
    /// Disables the camera/attachment button in the message composition view.
    ///
    /// Call this method to disable the camera/attachment button in the message composition view.
    public func messageComposeViewDisableUserAttachments(_ disable: Bool = true) -> some View {
        self.environment(\.messageComposeViewDisableUserAttachments, disable)
    }
    
    /// Attaches the specified attachment(s) to the message.
    ///
    /// Internally, provided attachment(s) will only be attached if ``MessageComposeView/canSendAttachments()`` returns `true`. If the attachment is a ``MessageComposeView/Attachment/data(attachmentData:typeIdentifier:fileName:)`` type, it will first be confirmed that ``MessageComposeView/isSupportedAttachmentUTI(_:)`` returns `true`.
    public func withAttachments(_ attachments: MessageComposeView.Attachment...) -> MessageComposeView {
        var newView = self
        newView.addAttachments(attachments)
        return newView
    }
    
    /// Attaches the specified attachment(s) to the message.
    ///
    /// Internally, provided attachment(s) will only be attached if ``MessageComposeView/canSendAttachments()`` returns `true`. If the attachment is a ``MessageComposeView/Attachment/data(attachmentData:typeIdentifier:fileName:)`` type, it will first be confirmed that ``MessageComposeView/isSupportedAttachmentUTI(_:)`` returns `true`.
    public func withAttachments(_ attachments: [MessageComposeView.Attachment]) -> MessageComposeView {
        var newView = self
        newView.addAttachments(attachments)
        return newView
    }
}
