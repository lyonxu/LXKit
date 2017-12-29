Pod::Spec.new do |s|
s.name         = 'KPLBlocks'
s.version      = '1.0.0'
s.summary      = '使用block替代监听点击'
s.homepage     = 'https://github.com/MrXiaoYang/KPLBlocks'
s.license      = 'MIT'
s.author       = { "Lyon.Xu" => "lyon_it@163.com" }
s.platform     = :ios, '6.0'
s.source       = { :git => "http://github.com/lyonxu/LXKit.git", :tag => s.version }
s.source_files = 'LXKit/**/*'
s.requires_arc = true
end