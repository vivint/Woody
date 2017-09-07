Pod::Spec.new do |s|
  s.name         = "Woody"
  s.version      = "0.1.0"
  s.summary      = "Woody is a micro logging framework for apps and frameworks"
  s.description  = <<-DESC
    Your description here.
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
