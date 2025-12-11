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
    public func disableUserAttachments(_ disable: Bool = true) -> MessageComposeView {
        var newView = self
        newView.disableUserAttachments = disable
        return newView
    }
    
    /// Attaches the specified attachment(s) to the message.
    ///
    /// Internally, provided attachment(s) will only be attached if ``MessageComposeView/canSendAttachments()`` returns `true`. If the attachment is a ``MessageComposeView/Attachment/data(attachmentData:typeIdentifier:fileName:)`` type, it will first be confirmed that ``MessageComposeView/isSupportedAttachmentUTI(_:)`` returns `true`.
    public func withAttachments(_ attachments: MessageComposeView.Attachment...) -> MessageComposeView {
        var newView = self
        newView.addAttachments(attachments)
        return newView
    }
}

extension MessageComposeView {
    /// Types of attachments to include in a text message.
    ///
    /// > Important: When sending attachments, it'll first be confirmed internally that they can be used by checking ``MessageComposeView/canSendAttachments()``.
    ///
    /// > Important: When using an attachment of type ``MessageComposeView/Attachment/data(attachmentData:typeIdentifier:fileName:)``, it'll first be confirmed internally that it can be used by checking it against ``MessageComposeView/isSupportedAttachmentUTI(_:)``.
    public enum Attachment {
        /// Attaches a specified file to the message.
        ///
        /// You can add zero or more attachments to a message before you display the message to the user. To access information about a message’s attachments, access the attachments property.
        /// 
        /// - Parameters:
        ///   - attachmentURL: The file URL for the attachment. Must not be `nil`.
        ///   - alternateFilename: If you supply a string here, the message UI uses it for the attachment. Use an alternate filename to better describe the attachment or to make the name more readable. OK to use a `nil` value, in which case the attachment’s actual filename is displayed in the message UI.
        case url(attachmentURL: URL, alternateFilename: String?)
        
        /// Attaches arbitrary content to the message.
        ///
        /// > Important: When using this type of attachment, it'll first be confirmed internally that it can be used by checking it against ``MessageComposeView/isSupportedAttachmentUTI(_:)``.
        ///
        /// This type is especially useful when the attachment you want to add to a message does not have a file system representation. This can be the case, for example, for programmatically composed audiovisual content.
        ///
        /// - Parameters:
        ///   - attachmentData: Content in the form of an [NSData](https://developer.apple.com/documentation/foundation/nsdata) object to attach to the message. Must not be `nil`.
        ///   - alternateFilename: A valid Uniform Type Identifier (UTI) appropriate for the attachment data. See [Uniform Type Identifiers Reference](https://developer.apple.com/library/archive/documentation/Miscellaneous/Reference/UTIRef/Introduction/Introduction.html#//apple_ref/doc/uid/TP40009257). Must not be `nil`.
        ///   - filename: The name to present to the user, in the message UI, for the data attachment.
        case data(attachmentData: Data, typeIdentifier: String, fileName: String)
    }
}
