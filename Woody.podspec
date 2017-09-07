Pod::Spec.new do |s|
  s.name         = "Woody"
  s.version      = "0.2.0"
  s.summary      = "Woody is a micro logging framework for apps and frameworks"
  s.description  = <<-DESC
    Woody is a micro logging framework with support for Swift & Objective-C that helps decouple which logging framework the end client (usually an app) would like to use. For example you have multiple in house frameworks which are used across multiple different apps and you don't want to tie them all to a specific logging framework like CocoaLumberjack or SwiftyBeaver. Woody allows you to not worry about that when developing those in house frameworks and instead leaves that up to the end consumer of your framework.
  DESC
  s.homepage     = "https://github.com/vivint/Woody"
  s.license      = { :type => "APACHE V2", :file => "LICENSE" }
  s.author       = { "Kaden Wilkinson" => "kaden.wilkinson@vivint.com" }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/vivint/Woody.git", :tag => s.version.to_s }
  s.source_files = "Sources/**/*"
  s.frameworks   = "Foundation"
end
