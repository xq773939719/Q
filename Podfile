install! 'cocoapods', :deterministic_uuids => false

workspace 'Q'
# source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
# Uncomment the next line to define a global platform for your project
platform :ios, '16.0'

use_frameworks!
use_modular_headers!
inhibit_all_warnings!
set_arc_compatibility_flag!

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
   config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
 end
end

#------ 业务组件 ------#
def BusinessModules

end


#------ 通用组件 ------#
def CommonModules

end

#------ 基础组件 ------#
def BaseModules
  
end

#------ 第三方库 ------#
def ThridPartyModules

  # 网络请求
  pod 'AFNetworking'
  pod 'Reachability'

  # 布局
  pod 'Masonry'
  pod 'YogaKit'
  pod 'SnapKit'
  pod 'SteviaLayout'
  
  # 图片
  pod 'Kingfisher'
  
  # pod 'ComponentKit' # UI组件
  pod 'SkeletonView' # 骨架视图

  # 响应式
  pod 'ReactiveCocoa'
  pod 'ReactiveObjC'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'ReSwift'
  
  pod 'IGListKit' # UICollectionView
  pod 'Carbon'
  
  # CrashReporter
  pod 'PLCrashReporter'

  # 通讯
  pod 'CocoaAsyncSocket'
  pod 'SocketRocket'
  
  pod 'MJExtension' # JSON Dictionary
  pod "Aspects" # AOP
  pod 'lottie-ios' # 动画
  pod 'pop' # Facebook开源动画库
  # pod 'LFLiveKit' # 直播处理

  pod 'Resolver'
  pod 'Factory'
  
  # 数据解析
  pod 'JSONModel'
  pod 'Mantle'

  # 数据库
  pod 'FMDB'
  pod 'RealmSwift'

  pod 'YYKit' # YYKit

  # PromiseKit
  pod "PromiseKit"
  pod 'PromisesSwift'
  
  # FaceBook SDK
  # pod 'FBSDKCoreKit'
  
  # Firebase SDK
  # pod 'Firebase'
  
  # 组件化
  pod "CTMediator"

  # 日志框架
  pod 'CocoaLumberjack'
  pod "NSLogger"
  
  # gRPC
  # pod 'gRPC'
  # pod 'gRPC-Core'
  # pod 'gRPC-ProtoRPC'
  
  # proto
  pod 'Protobuf'

  # 压缩解压
  # pod 'SSZipArchive'

  # 弹窗
  pod 'Toast'

  # JS热修复 交互
  pod 'JSPatch'
  # pod 'WebViewJavascriptBridge'

  # 正则表达式
  pod 'RegexKitLite-NoWarning'

  pod 'GPUImage' # 图像
  pod 'SDWebImage' # 图像展示
  
  # Crash 防护
  pod 'JJException'

  pod 'SwiftTheme' # 主题框架
  
  pod 'GRDB.swift'
  
  pod 'ReachabilitySwift'
  
  # pod 'Charts'
  # pod 'ChartsRealm'
  
  pod 'SwiftDate'
  
  pod 'Alamofire'

  pod 'SwifterSwift'
  pod 'SQLite.swift'
  pod 'SwiftLint'
  # pod 'Quick'
  # pod 'Nimble'
  
  pod 'Texture' # pod 'AsyncDisplayKit' 废弃 目前在 Texture
  pod 'BlocksKit'
  pod 'Typeset'
  pod 'FSCalendar' # 日历

  # 分享
  # pod 'ShareSDK3'
  # pod 'ShareSDK3/ShareSDKUI'
  # pod 'ShareSDK3/ShareSDKConfigurationFile'
  # pod 'ShareSDK3/ShareSDKExtension'
  # pod 'ShareSDK3/ShareSDKPlatforms'
  # pod 'ShareSDK3/ShareSDKPlatforms/WeChat'
  # pod 'ShareSDK3/ShareSDKPlatforms/QQ'
  # pod 'ShareSDK3/PlatformConnector/SinaWeibo'
  
  
  pod 'Cache'  # 缓存
  # pod 'SwiftMessages' # 弹框提示
  # pod 'ImagePicker' # 图片选择
  
  pod 'ChameleonFramework' # 颜色库
  pod 'GrowingAnalytics-cdp/Autotracker'
  
  # 跨平台
  # pod 'Hummer', :git => 'git@git.zhlh6.cn:didi/Hummer.git', :branch => 'master'

  # 内存检测
  # pod 'FBRetainCycleDetector'
  # pod 'MLeaksFinder'
  # pod 'OOMDetector'

  #------ 调试组件 ------#
  pod 'LookinServer', :configurations => ['Debug']
  pod 'FLEX', :configurations => ['Debug']   # Xcode界面调试工具

end

#------ 开发组件 ------#
# !!! 不要忘记注释相应的模块
def DevelopModule
  pod 'QTools', :path => '../Develop/QTools'
  pod 'QPlayer', :path => '../Develop/QPlayer'
  pod 'Flutter', :podspec => './Q/Framework/Flutter/Debug/Flutter.podspec', :configurations => ['Debug']
end

# Pods for Q
target 'Q' do
  # Comment the next line if you don't want to use dynamic frameworks
  DevelopModule()
  ThridPartyModules()
  BaseModules()
  CommonModules()
  BusinessModules()
end
