Pod::Spec.new do |s|
  s.name         = 'AWSCognito'
  s.version      = '2.6.11'
  s.summary      = 'Amazon Cognito SDK for iOS'

  s.description  = 'Amazon Cognito offers multi device data synchronization with offline access'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Amazon Software License'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.source       = { :git => 'https://github.com/bvjustin/aws-sdk-objc.git',
                     :tag => s.version}
  s.requires_arc = true
  s.library      = 'sqlite3' 
  s.dependency 'AWSCore', '2.6.11'
  s.source_files = 'AWSCognito/*.{h,m}', 'AWSCognito/**/*.{h,m}'
  s.public_header_files = 'AWSCognito/*.h', 'AWSCognito/CognitoSync/*.h'
  s.private_header_files = 'AWSCognito/Fabric/*.h', 'AWSCognito/Internal/*.h'
end
