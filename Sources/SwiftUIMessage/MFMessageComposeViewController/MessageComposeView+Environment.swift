//
//  MessageComposeView+Environment.swift
//  SwiftUIMessage
//
//  Created by Edon Valdman on 7/2/26.
//

import SwiftUI

extension EnvironmentValues {
    /// Disables the camera/attachment button in the message composition view.
    ///
    /// Set this property to `true` to disable the camera/attachment button in the message composition view.
    @Entry
    public var messageComposeViewDisableUserAttachments: Bool = false
}
