Pod::Spec.new do |s|
  s.name             = "SwiftyUtils"
  s.version          = "1.0.0"
  s.summary          = "Swift Utils"
  s.homepage         = "https://github.com/AlexZd"
  s.license          = 'MIT'
  s.author           = { "Alex Z" => "alexzd89@mail.ru" }
  s.source           = { :git => "https://github.com/AlexZd/SwiftUtils.git", :tag => s.version }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Pod/Utils/**/*'
end