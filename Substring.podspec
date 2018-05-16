Pod::Spec.new do |s|
  s.name        = 'Substring'
  s.module_name = 'Substring'
  s.version     = '1.0.0'
  s.summary     = 'Substring without boilerplate code.'

  s.homepage    = 'https://github.com/Meniny/Substring'
  s.license     = { type: 'MIT', file: 'LICENSE.md' }
  s.authors     = { 'Elias Abel' => 'admin@meniny.cn' }
  s.social_media_url = 'https://meniny.cn/'
  # s.screenshot = ''

  s.ios.deployment_target     = '8.0'
  s.osx.deployment_target     = '10.9'
  s.tvos.deployment_target    = '9.0'
  s.watchos.deployment_target = '2.0'

  s.requires_arc        = true
  s.source              = { git: 'https://github.com/Meniny/Substring.git', tag: s.version.to_s }
  s.source_files        = 'Substring/**/*.swift'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.1' }
  s.swift_version       = '4.1'
  # s.documentation_url   = 'https://github.com/Meniny/Substring/docs'

  # s.dependency "Jsonify"
end
