Pod::Spec.new do |s|
  s.name             = "SRT"
  s.version          = "1.0.0"
  s.summary          = "Swift Repeatable Tools"
  s.homepage         = "https://github.com/AlexZd/SRT"
  s.license          = 'MIT'
  s.author           = { "Alex Z" => "alexzd89@mail.ru" }
  s.source           = { :git => "https://github.com/AlexZd/SRT.git", :tag => s.version }
  s.platform         = :ios, '9.0'
  s.requires_arc     = true
  # s.source_files     = 'Pod/Utils/**/*'

  s.subspec 'UIView+Helpers' do |ss|
    ss.source_files = 'Pod/Utils/UIView+Helpers/**/*'
  end
  s.subspec 'Photos' do |ss|
    ss.source_files = 'Pod/Utils/Photos/**/*'
  end
  s.subspec 'Other' do |ss| 
    ss.source_files = 'Pod/Utils/*.{swift}'
  end

end