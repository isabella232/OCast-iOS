//
// OCastSettings.swift
//
// Copyright 2019 Orange
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

/// The device setttings service name.
public let OCastDeviceSettingsServiceName = "org.ocast.settings.device"

/// The input setttings service name.
public let OCastInputSettingsServiceName = "org.ocast.settings.input"

// MARK: - Settings objects

/// The update state.
///
/// - notChecked: The firmware version is not check yet.
/// - upToDate: The firmware version is up to date.
/// - newVersionFound: A new firmware version is available.
/// - newVersionReady: A new firmware is ready to be installed.
/// - downloading: A firmware version is downloading.
/// - error: An error occurs during the firmware update.
/// - success: The firmware update has ended with success.
@objc
public enum UpdateState: Int, RawRepresentable, Codable {
    case notChecked, upToDate, newVersionFound, newVersionReady, downloading, error, success
    
    public typealias RawValue = String
    
    public var rawValue: RawValue {
        switch self {
        case .notChecked: return "notChecked"
        case .upToDate: return "upToDate"
        case .newVersionFound: return "newVersionFound"
        case .newVersionReady: return "newVersionReady"
        case .downloading: return "downloading"
        case .error: return "error"
        case .success: return "success"
        }
    }
    
    public init?(rawValue: RawValue) {
        switch rawValue {
        case "notChecked": self = .notChecked
        case "upToDate": self = .upToDate
        case "newVersionFound": self = .newVersionFound
        case "newVersionReady": self = .newVersionReady
        case "downloading": self = .downloading
        case "error": self = .error
        case "success": self = .success
        default: return nil
        }
    }
}

/// The update status.
@objc
@objcMembers
public class UpdateStatus: OCastMessage {
    
    /// The state. See `UpdateState`
    public let state: UpdateState
    
    /// The version.
    public let version: String?
    
    /// The percentage downloaded.
    public let progress: Int
}

/// The device identifier.
@objc
@objcMembers
public class DeviceID: OCastMessage {
    
    /// The identifier.
    public let id: String
}

/// The gamepad axes.
@objc
@objcMembers
public class GamepadAxes: OCastMessage {
    
    /// The x axis (-1.0 -> 1.0).
    public let x: Float
    
    /// The y axis (-1.0 -> 1.0).
    public let y: Float
    
    public let num: Int
}

// MARK: - Settings Parameters

/// The update status parameters.
@objc
@objcMembers
public class UpdateStatusCommandParams: OCastMessage {}

/// The device id parameters.
@objc
@objcMembers
public class DeviceIDCommandParams: OCastMessage {}

/// The location of a key.
///
/// - standard: The key is not pressed on the right or left side of the keyboard, nor the numeric keypad.
/// - left: A left key is pressed.
/// - right: A right key is pressed.
/// - numpad: The key is pressed on the numeric keypad.
@objc
public enum DOMKeyLocation: Int, Codable {
    case standard = 0
    case left = 1
    case right = 2
    case numpad = 3
}

/// The parameters to send a key event.
@objc
@objcMembers
public class KeyEventCommandParams: OCastMessage {
    
    /// The key value.
    public let key: String
    
    /// The  code value of the physical key.
    public let code: String
    
    /// `true` if the control key is pressed.
    public let ctrl: Bool
    
    /// `true` if the alt key is pressed.
    public let alt: Bool
    
    /// `true` if the shift key is pressed.
    public let shift: Bool
    
    /// `true` if the meta key is pressed.
    public let meta: Bool
    
    /// The location.
    public let location: DOMKeyLocation
}

/// The parameters to send a mouse event.
@objc
@objcMembers
public class MouseEventCommandParams: OCastMessage {
    
    /// The x coordinate of the mouse pointer in local coordinates.
    public let x: Int
    
    /// The y coordinate of the mouse pointer in local coordinates.
    public let y: Int
    
    /// The buttons pressed.
    /// Several buttons can be pressed at the same time by providing the bitmask representation of each button
    /// (0 no button, 1, 2 and 4 at least)
    public let buttons: Int
}

/// The parameters to send a gamepad event.
@objc
@objcMembers
public class GamepadEventCommandParams: OCastMessage {
    
    /// The axes.
    public let axes: [GamepadAxes]
    
    /// The buttons pressed.
    /// Several buttons can be pressed at the same time by providing the bitmask representation of each button
    /// (0 no button, 1, 2 and 4 at least)
    public let buttons: Int
}

// MARK: - Settings error codes

/// The device settings errors.
///
/// - unknownError: An unknown error occurs.
@objc
public enum DeviceSettingsError: Int, Error {
    case unknownError = 1199
}
