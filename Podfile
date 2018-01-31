platform :ios, '9.0'
target 'Partyvity' do
    use_frameworks!
    pod 'Reactant', '~> 1.0'
    pod 'ReactantUI'
    pod 'ReactantLiveUI', :configuration => 'Debug'
    pod 'Fetcher'
    pod 'TorchORM', :git => 'https://github.com/SwiftKit/Torch.git', :branch => 'swift-pm'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if ['TorchORM'].include? "#{target}"
            print "Setting #{target}'s SWIFT_VERSION to 3.0\n"
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
