#
# Be sure to run `pod lib lint CQAlertView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CQAlertView'
  s.version          = '0.1.0'
  s.summary          = 'A short description of CQAlertView.'
  s.description      = <<-DESC
自定义弹框内容显示。
                       DESC

  s.homepage         = 'https://github.com/cq1402272764/CQAlertView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'cq1402272764' => '954919456@qq.com' }
  s.source           = { :git => 'https://github.com/cq1402272764/CQAlertView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CQAlertView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CQAlertView' => ['CQAlertView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
