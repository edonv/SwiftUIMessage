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
    /// In iOS 7.0 and later, call this method to disable the camera/attachment button in the message composition view.
    public func disableUserAttachments(_ disable: Bool = true) -> MessageComposeView {
        var newView = self
        newView.disableUserAttachments = disable
        return newView
    }
    
    /// Attaches a specified attachment to the message.
    public func withAttachments(_ attachments: MessageComposeView.Attachment...) -> MessageComposeView {
        var newView = self
        newView.addAttachments(attachments)
        return newView
    }
}

extension MessageComposeView {
    public enum Attachment {
        /// Attaches a specified file to the message.
        ///
        /// You can add zero or more attachments to a message before you display the message to the user. To access information about a message’s attachments, access the attachments property.
        /// - Parameters:
        ///   - attachmentURL: The file URL for the attachment. Must not be `nil`.
        ///   - alternateFilename: If you supply a string here, the message UI uses it for the attachment. Use an alternate filename to better describe the attachment or to make the name more readable. OK to use a `nil` value, in which case the attachment’s actual filename is displayed in the message UI.
        case url(attachmentURL: URL, alternateFilename: String?)
        
        /// Attaches arbitrary content to the message.
        ///
        /// This method is especially useful when the attachment you want to add to a message does not have a file system representation. This can be the case, for example, for programmatically composed audiovisual content.
        /// - Parameters:
        ///   - attachmentData: Content in the form of an [NSData](https://developer.apple.com/documentation/foundation/nsdata) object to attach to the message. Must not be `nil`.
        ///   - alternateFilename: A valid Uniform Type Identifier (UTI) appropriate for the attachment data. See [Uniform Type Identifiers Reference](https://developer.apple.com/library/archive/documentation/Miscellaneous/Reference/UTIRef/Introduction/Introduction.html#//apple_ref/doc/uid/TP40009257). Must not be `nil`.
        ///   - filename: The name to present to the user, in the message UI, for the data attachment.
        case data(attachmentData: Data, typeIdentifier: String, fileName: String)
    }
}
