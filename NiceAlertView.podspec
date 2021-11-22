Pod::Spec.new do |spec|

  spec.name         = "NiceAlertView"
  spec.version      = "0.0.1"
  spec.summary      = "Nice and beautiful AlertView for your iOS project"
  spec.description  = "NiceAlertView is a Swift framework that can increase time of development and show nice custom AlertsViews"

  spec.homepage     = "https://github.com/danielbeltrami89/NiceAlertView"
  spec.license      = { :type => "MIT", :file => "README.md" }
  spec.author       = { "Daniel Beltrami" => "moraesdan89@gmail.com" }

  spec.platform     = :ios, "10.0"
  spec.swift_version = '5.0'

  spec.source       = { :git => "https://github.com/danielbeltrami89/NiceAlertView.git",
                        :tag => "#{spec.version}" }

  spec.source_files        = "NiceAlertView/**/*.{h,m,swift}"
  spec.public_header_files = "NiceAlertView/**/*.h"
 
  spec.dependency "SnapKit", "~> 5.0"

end
