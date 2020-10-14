Pod::Spec.new do |s|
  s.name             = "AttributedStringBuilder"
  s.version          = "1.2"
  s.summary          = "Easy Attributed Strings"

  s.description      = <<-DESC
Attributed String Builder makes it easy to create NSAttributedStrings with a 'swifty' syntax
                       DESC

  s.homepage         = "https://github.com/SteveBarnegren/AttributedStringBuilder"
  s.license          = 'MIT'
  s.author           = { "Steve Barnegren" => "steve.barnegren@gmail.com" }
  s.source           = { :git => "https://github.com/SteveBarnegren/AttributedStringBuilder.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/stevebarnegren'

  s.ios.deployment_target = '10.0'
  s.tvos.deployment_target = '10.0'
  s.osx.deployment_target = '10.14'
  s.swift_version = '5.0'

  s.source_files = 'AttributedStringBuilder/AttributedStringBuilder/*.swift'
 
end
