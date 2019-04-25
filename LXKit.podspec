Pod::Spec.new do |s|
s.name         = 'LXKit'
s.version      = '1.0.2'
s.summary      = 'LXKit with some category, UIKit components, etc.'
s.homepage     = 'https://github.com/lyonxu/LXKit'
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.author       = { "Lyon.Xu" => "lyon_it@163.com" }
s.platform     = :ios, '6.0'
s.source       = { :git => "https://github.com/lyonxu/LXKit.git", :tag => s.version.to_s }
s.source_files = 'LXKit/**/*.{h,m}'
s.public_header_files = 'LXKit/**/*.{h}'
s.requires_arc = true
end