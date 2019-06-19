//
// UPNPDevice.swift
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

/// Class to represent a device found on the local network.
@objc public final class UPNPDevice: NSObject {
    
    /// The base URL of the device.
    public let baseURL: URL
    
    /// The IP address.
    public let ipAddress: String
    
    /// The service port.
    public let servicePort: UInt16
    
    /// The unique device ID (aka USN).
    public let deviceID: String
    
    /// The friendly name.
    public let friendlyName: String
    
    /// The manufacturer's name.
    public let manufacturer: String
    
    /// The model name.
    public let modelName: String
    
    init(baseURL: URL, ipAddress: String, servicePort: UInt16, deviceID: String, friendlyName: String, manufacturer: String, modelName: String) {
        self.baseURL = baseURL
        self.ipAddress = ipAddress
        self.servicePort = servicePort
        self.deviceID = deviceID
        self.friendlyName = friendlyName
        self.manufacturer = manufacturer
        self.modelName = modelName
    }
}
