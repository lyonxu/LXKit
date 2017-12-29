Pod::Spec.new do |s|
s.name         = 'LXKit'
s.version      = '1.0.0'
s.summary      = 'LXKit with some category, UIKit components, etc.'
s.homepage     = 'https://github.com/lyonxu/LXKit'
s.license      = 'MIT'
s.author       = { "Lyon.Xu" => "lyon_it@163.com" }
s.platform     = :ios, '6.0'
s.source       = { :git => "https://github.com/lyonxu/LXKit.git", :tag => "#{s.version}" }
s.source_files = 'LXKit/**/*'
s.requires_arc = true
end