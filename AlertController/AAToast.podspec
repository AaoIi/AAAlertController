#
#  Be sure to run `pod spec lint AAToast.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "AlertController"
  spec.version      = "1.0.0"
  spec.summary      = "An alternative to UIAlertController with amazing amiations - Swift"

  spec.description  = "AAAlertController is another alternative of UIAlertController, some people would say UIAlertController already exists! but my reason to create this alert because UIAlertController still having bugs to change the tint color of the whole app at some point.<br/>
The Alert is fully optimzed to handle long entred text for title and message, and a completion block for each button pressed with different amazing kinds of animations."
  spec.homepage     = "https://github.com/AaoIi/AlertController"
  spec.screenshots  = 'https://raw.githubusercontent.com/AaoIi/AAAlertController/master/demo1.gif'

  spec.license      = "MIT"

  spec.author             = "Saad Albasha"
  # Or just: spec.author    = "Saad Albasha"

  # spec.platform     = :ios
  spec.platform     = :ios, "8.0"
  spec.swift_version = '5.0'

  spec.source       = { :git => "https://github.com/AaoIi/AlertController.git", :tag => "1.0.0" }

  spec.source_files  = 'AlertController/**/*.swift','AlertController/**/*.h'
  spec.ios.resource_bundle = {
    'AAToast' => ['AlertController/**/*.xib']
  }


end
