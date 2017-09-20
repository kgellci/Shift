#
# Be sure to run `pod lib lint Shift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Shift'
  s.version          = '0.2.2'
  s.summary          = 'Gradient Animation based on time or motion'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Gradient Animation based on time or motion.
Ability fo mask gradient animations on text or images.
                       DESC

  s.homepage         = 'https://github.com/kgellci/Shift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kgellci' => 'kgellci@gmail.com' }
  s.source           = { :git => 'https://github.com/kgellci/Shift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/kgellci'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Shift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Shift' => ['Shift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'CoreMotion'
  # s.dependency 'AFNetworking', '~> 2.3'
end
