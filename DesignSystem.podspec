Pod::Spec.new do |spec|

    spec.name         = "DesignSystem"
    spec.version      = "0.0.1"
    spec.summary      = "A CocoaPods library written in Swift"
  
    spec.description  = "MVP design system. will serve as a study for future implementations"
  
    spec.homepage     = "https://github.com/JrFernando10/DesignSystem"
    spec.license      = { :type => "MIT", :file => "LICENSE" }
    spec.author       = { "fernando" => "fernandojuniior18@gmail.com" }
  
    spec.ios.deployment_target = "13.0"
    spec.swift_version = "5"
  
    spec.source        = { :path => "." }
    spec.source_files  = "DesignSystem/**/*.{h,m,swift}"
    spec.resources = [
        'DesignSystem/Resources/**/*.{json}',
      ]
  
  end
