#
#  Be sure to run `pod spec lint ACEasyDate.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "ACEasyDate"
  spec.version      = "0.1.0"
  spec.summary      = "ACEasyDate Library"
  spec.description  = "ACEasyDate library helps you to handle the time operations"
  spec.homepage     = "https://github.com/andrewcookies/easy-date.git"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author       = { "andrewcookies" => "andreacolussi00@gmail.com" }
  spec.ios.deployment_target = "12.1"
  spec.swift_version = "4.2"
  spec.source       = { :git => "git@github.com:andrewcookies/easy-date.git", :tag => "release/#{spec.version}" }
  spec.source_files  = "ACEasyDate/**/*.{h,m,swift}"

end
