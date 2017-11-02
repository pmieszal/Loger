#
# Be sure to run `pod lib lint Loger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Loger'
  s.version          = '0.2.2'
  s.summary          = 'Loger is simple logging framework written in Swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Loger is simplified logging framework written in pure Swift. All you need to do, is define `LogLevel`, formatting and endpoint (simple `print`, or whatever you want).
                       DESC

  s.homepage         = 'https://github.com/pmieszal/Loger'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Patryk Mieszała' => 'patryk.mieszala@gmail.com' }
  s.source           = { :git => 'https://github.com/pmieszal/Loger.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.12'

  s.source_files = 'Loger/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Loger' => ['Loger/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
