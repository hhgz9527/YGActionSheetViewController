#
# Be sure to run `pod lib lint YGActionSheetViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YGActionSheetViewController'
  s.version          = '0.1.0'
  s.summary          = 'YGUI - Action Sheet View.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/hhgz9527/YGActionSheetViewController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hhgz9527' => 'gaoyu.dreamer@gmail.com' }
  s.source           = { :git => 'https://github.com/hhgz9527/YGActionSheetViewController.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/gaoyu_dreamer'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YGActionSheetViewController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YGActionSheetViewController' => ['YGActionSheetViewController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
    s.dependency 'SnapKit', '~> 3.2.0'
end
