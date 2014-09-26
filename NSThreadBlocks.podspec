Pod::Spec.new do |s|
  s.name            = 'NSThreadBlocks'
  s.author          = { "Dmitry Ponomarev" => "demdxx@gmail.com" }
  s.version         = '0.0.1'
  s.license         = 'MIT'
  s.summary         = 'Extension of the NSThread.'
  s.homepage        = 'https://github.com/demdxx/NSThreadBlocks'
  s.source          = {:git => 'https://github.com/demdxx/NSThreadBlocks.git', :tag => 'v0.0.1'}


  s.platform        = :ios

  s.source_files    = '*.{h,m}'
  s.requires_arc    = false

  s.ios.frameworks  = 'Foundation'
end