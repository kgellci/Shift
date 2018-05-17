Pod::Spec.new do |s|
  s.name             = 'Shift'
  s.version          = '0.3.0'
  s.summary          = 'Gradient Animation based on time or motion'

  s.description      = <<-DESC
Gradient Animation based on time or motion.
Ability fo mask gradient animations on text or images.
                       DESC

  s.homepage         = 'https://github.com/kgellci/Shift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kgellci' => 'kgellci@gmail.com' }
  s.source           = { :git => 'https://github.com/kgellci/Shift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/kgellci'
  s.ios.deployment_target = '8.0'
  s.source_files = 'Shift/Classes/**/*'
  s.frameworks = 'UIKit', 'CoreMotion'
end
