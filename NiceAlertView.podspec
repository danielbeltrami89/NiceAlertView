Pod::Spec.new do |spec|

  spec.name         = "NiceAlertView"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of NiceAlertView."
  spec.description  = "Betters e nice AlertViews"

  spec.homepage     = "http://github.com/NiceAlertView"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author       = { "Daniel Beltrami" => "moraesdan89@gmail.com" }

  spec.platform     = :ios, "10.0"

  spec.source       = { :git => "http://github.com/NiceAlertView.git",
                        :tag => "#{spec.version}" }

  spec.source_files        = "NiceAlertView/**/*.{h,m,swift}"
  spec.public_header_files = "NiceAlertView/**/*.h"
 
  spec.dependency "SnapKit", "~> 5.0"

end
