//
//  MessageComposeView.swift
//  
//
//  Created by Edon Valdman on 3/2/23.
//

import SwiftUI
import MessageUI
import Messages

/// To be notified of the `View`'s completion and to obtain its completion result, register as an observer of the ``Notifiction.Name/MCViewDidFinish`` notification.
public struct MessageComposeView: UIViewControllerRepresentable {
    public var initialMessageInfo: MessageInfo
    
    /// Disables the camera/attachment button in the message composition view.
    ///
    /// In iOS 7.0 and later, set this property to `true` to disable the camera/attachment button in the message composition view.
    internal var disableUserAttachments: Bool = false
    
    private var attachments: [Attachment] = []
    
    public init(_ initialMessageInfo: MessageInfo) {
        self.initialMessageInfo = initialMessageInfo
    }
    
    public func makeUIViewController(context: Context) -> MFMessageComposeViewController {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = context.coordinator
        
        composeVC.recipients = initialMessageInfo.recipients
        composeVC.subject = initialMessageInfo.subject
        composeVC.body = initialMessageInfo.body
        composeVC.message = initialMessageInfo.message

        if disableUserAttachments {
            composeVC.disableUserAttachments()
        }
        
        for a in attachments {
            switch a {
            case .url(let attachmentURL, let alternateFilename):
                composeVC.addAttachmentURL(attachmentURL, withAlternateFilename: alternateFilename)

            case .data(let attachmentData, let typeIdentifier, let fileName):
                composeVC.addAttachmentData(attachmentData, typeIdentifier: typeIdentifier, filename: fileName)
            }
        }
        
        return composeVC
    }
    
    public func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: Context) {
        
    }
    
    public func makeCoordinator() -> MCCoordinator {
        MCCoordinator(self)
    }
    
    public mutating func addAttachments(_ attachments: [Attachment]) {
        self.attachments.append(contentsOf: attachments)
    }
}

// MARK: - MFMessageComposeViewControllerDelegate

extension MessageComposeView {
    public static let MCViewDidFinishResultKey = "SwiftUIMessage.MCViewDidFinishResultKey"
    
    public class MCCoordinator: NSObject, MFMessageComposeViewControllerDelegate {
        internal var parent: MessageComposeView
        
        internal init(_ parent: MessageComposeView) {
            self.parent = parent
        }
        
        public func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            NotificationCenter.default.post(
                name: .MCViewDidFinish,
                object: parent,
                userInfo: [
                    MessageComposeView.MCViewDidFinishResultKey: result
                ])
            controller.dismiss(animated: true)
        }
    }
}

// MARK: - Initial Message Info
extension MessageComposeView {
    public struct MessageInfo {
        public init(recipients: [String]? = nil, subject: String? = nil, body: String? = nil, message: MSMessage? = nil) {
            self.recipients = recipients
            self.subject = subject
            self.body = body
            self.message = message
        }
        
        /// An array of strings that contains the initial recipients of the message.
        ///
        /// If you want to provide an initial array of one or more recipients for a message, do so before you display it. After the message is displayed you cannot change the value of this property.
        ///
        /// Each string in the array should contain the phone number of the intended recipient.
        public var recipients: [String]?
        
        /// The initial subject of the message.
        ///
        /// If you want to provide an initial subject for a message, do so before you display it. After the message is displayed you cannot change the value of this property.
        public var subject: String?
        
        /// The initial content of the message.
        ///
        /// If you want to provide initial content in the body of a message, do so before you display it. After the message is displayed you cannot change the value of this property.
        public var body: String?
        
        /// A message object from your iMessage app extension.
        ///
        /// If your app has an iMessage app extension, you can display your iMessage app within the message compose view, just as you would in the Messages app. To display your iMessage app, create and assign an [MSMessage](https://developer.apple.com/documentation/messages/msmessage) object to this property.
        ///
        /// By default, this property is set to `nil`.
        ///
        /// For more information on creating iMessage apps, see [Messages](https://developer.apple.com/documentation/messages).
        public var message: MSMessage?
    }
}

// MARK: - Convenience Access to Class Functions

extension MessageComposeView {
    /// Returns a Boolean value that indicates whether the current device is capable of sending text messages.
    ///
    /// Always call this method before attempting to present the message compose view controller. A device may be unable to send messages if it does not support messaging or if it is not currently configured to send messages. This method applies only to the ability to send text messages via iMessage, SMS, and MMS.
    ///
    /// To be notified of changes in the availability of sending text messages, register as an observer of the [MFMessageComposeViewControllerTextMessageAvailabilityDidChange](https://developer.apple.com/documentation/foundation/nsnotification/name/1614064-mfmessagecomposeviewcontrollerte) notification.
    /// - Returns: `true` if the device can send text messages or `false` if it cannot.
    static func canSendText() -> Bool {
        MFMessageComposeViewController.canSendText()
    }
    
    /// Indicates whether or not messages can include attachments.
    /// - Returns: `true` if the device can send attachments in MMS or iMessage messages, or `false` otherwise.
    static func canSendAttachments() -> Bool {
        MFMessageComposeViewController.canSendAttachments()
    }
    
    /// Indicates whether or not messages can include subject lines, according to the user’s configuration in Settings.
    /// - Returns: `true` if the device can include subject lines in messages, or `false` otherwise.
    static func canSendSubject() -> Bool {
        MFMessageComposeViewController.canSendSubject()
    }
    
    /// Indicates whether or not the message can accept a file, with the specified UTI, as an attachment.
    /// - Parameter uti: The UTI (Uniform Type Identifier) in question. See [Uniform Type Identifiers Reference](https://developer.apple.com/library/archive/documentation/Miscellaneous/Reference/UTIRef/Introduction/Introduction.html#//apple_ref/doc/uid/TP40009257).
    /// - Returns: `true` if a file with the specified UTI can be attached to the message, or `false` otherwise.
    static func isSupportedAttachmentUTI(_ uti: String) -> Bool {
        MFMessageComposeViewController.isSupportedAttachmentUTI(uti)
    }
}

struct MailComposeView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 14.0, *) {
            MessageComposeView(.init(
//                recipients: [
//                "7863273437",
//                "edon@valdman.works"
//            ],
//                                  body: "Test"
            ))
            .ignoresSafeArea()
        } else {
            // Fallback on earlier versions
        }
    }
}
