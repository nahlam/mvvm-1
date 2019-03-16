platform :ios, '11.0'
inhibit_all_warnings!
use_frameworks!

def all_pods
    

    pod 'SwiftLint', '~> 0.28'
    pod 'SwiftMessages', '~> 6.0'
    pod 'MRProgress', '~> 0.8'

    pod 'RxSwift', '~> 4.4'
    pod 'RxCocoa', '~> 4.4'
    pod 'RxOptional', '~> 3.6'
    
    pod 'Moya/RxSwift', '~> 12.0'
    
    pod 'Swinject', '~> 2.5'
    pod 'SwinjectStoryboard', '~> 2.1'
    
    pod 'R.swift', '~> 5.0'
    pod 'Kingfisher', '~> 5.2'

end

target 'BSMVVM' do
    all_pods
    target 'BSMVVMTests' do
        inherit! :search_paths
        pod 'RxBlocking'
        pod 'RxTest'
    end
end
