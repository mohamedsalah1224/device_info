Pod::Spec.new do |s|
  s.name             = 'device_info'
  s.version          = '1.0.1'
  s.summary          = 'Module to get device info.'
  s.description      = <<-DESC
Module to get device info.
                       DESC
  s.homepage         = 'https://github.com/mnayef95/intelligence_questions_flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Developer - Receipt Wallet' => 'developer@receiptwallet.app' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  s.dependency 'KeychainSwift'
end
