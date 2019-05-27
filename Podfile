source 'https://github.com/CocoaPods/Specs.git'

inhibit_all_warnings!
use_frameworks!

workspace 'OCast'
project 'OCast.xcodeproj'
project 'OCastDemo.xcodeproj'

target :OCast do
    platform :ios, '8.0'
    project 'OCast.xcodeproj'
    pod 'CocoaAsyncSocket', '7.6.3'
    pod 'DynamicCodable', '1.0'
    pod 'Starscream', '3.1.0'
end

target :OCastTests do
    platform :ios, '8.0'
    project 'OCast.xcodeproj'
end

target :OCastDemoSwift do
    platform :ios, '8.0'
    pod 'OCast', :path => "./"
    project 'OCastDemo.xcodeproj'
end

target :OCastDemoObjC do
    platform :ios, '8.0'
    pod 'OCast', :path => "./"
    project 'OCastDemo.xcodeproj'
end
