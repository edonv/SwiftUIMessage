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
}

extension MailComposeView {
    /// This is used to add the specified data as an attachment to an email message.
    ///
    /// The specified data is attached after the message body, but before the user’s signature.
    ///
    /// - Note: You may attach multiple files (using different file names).
    public struct AttachmentData {
        public init(attachment: Data, mimeType: String, fileName: String) {
            self.attachment = attachment
            self.mimeType = mimeType
            self.fileName = fileName
        }
        
        /// The data to attach. Typically, this is the contents of a file that you want to include.
        var attachment: Data
        
        /// The MIME type of the specified data. (For example, the MIME type for a JPEG image is `image/jpeg`.) For a list of valid MIME types, see [http://www.iana.org/assignments/media-types/](http://www.iana.org/assignments/media-types/).
        var mimeType: String
        
        /// The preferred filename to associate with the data. This is the default name applied to the file when it is transferred to its destination. Any path separator (/) characters in the filename are converted to underscore (\_) characters prior to transmission.
        var fileName: String
    }
}
