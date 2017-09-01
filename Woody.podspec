Pod::Spec.new do |s|
  s.name         = "Woody"
  s.version      = "0.1"
  s.summary      = ""
  s.description  = <<-DESC
    Your description here.
  DESC
  s.homepage     = ""
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Kaden Wilkinson" => "kaden.wilkinson@vivint.com" }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "ssh://git@source.vivint.com:7999/~kaden.wilkinson/woody.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
