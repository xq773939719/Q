install! 'cocoapods'

workspace 'Q'
source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

use_frameworks!
use_modular_headers!
inhibit_all_warnings!
set_arc_compatibility_flag!

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

  # 响应式
  pod 'ReactiveCocoa'
  pod 'ReactiveObjC'
  pod 'RxSwift'
  pod 'RxCocoa'

  # 图片
  pod 'SDWebImage'
  
  # UICollectionView
  pod 'IGListKit'
  
  # CrashReporter
  pod 'PLCrashReporter'

  # Socket 库
  pod 'CocoaAsyncSocket'
  
  # JSON Dictionary
  pod 'MJExtension'

  pod "Aspects"
  
  # 动画
  pod 'lottie-ios'

  # 数据解析
  pod 'JSONModel'

  # 数据库
  pod 'FMDB'
  pod 'RealmSwift'

  # YYKit
  pod 'YYKit'

  # PromiseKit
  pod "PromiseKit"
  pod 'PromisesSwift'
  
  # FaceBook SDK
  # pod 'FBSDKCoreKit'
  
  # Firebase SDK
  # pod 'Firebase'
  
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
  pod 'SSZipArchive'

  # 弹窗
  pod 'Toast'

  # JS热修复 交互
  pod 'JSPatch'
  pod 'WebViewJavascriptBridge'

  # 正则表达式
  pod 'RegexKitLite-NoWarning'

  # 图像
  pod 'GPUImage'
  
  # UI
  pod 'ComponentKit'
  
  # Crash 防护
  pod 'JJException'
  
  pod 'SocketRocket'
  
  # 主题框架
  pod 'SwiftTheme'
  
  pod 'GRDB.swift'
  
  pod 'ReachabilitySwift'
  
  pod 'Charts'
  pod 'ChartsRealm'
  
  pod 'SwiftDate'
  
  pod 'Alamofire'

  pod 'SwifterSwift'
  pod 'SQLite.swift'
  pod 'SwiftLint'
  pod 'SnapKit'
  # pod 'Quick'
  # pod 'Nimble'
  

  # 跨平台
  # pod 'Hummer', :git => 'git@git.zhlh6.cn:didi/Hummer.git', :branch => 'master'

  #------ 调试组件 ------#
  pod 'LookinServer', :configurations => ['Debug']
  pod 'FLEX', :configurations => ['Debug']   # Xcode界面调试工具

end

#------ 开发组件 ------#
# !!! 不要忘记注释相应的模块
def DevelopModule
  pod 'QTools', :path => '../Develop/QTools'
  pod 'Flutter', :podspec => './Flutter/debug/Flutter.podspec'
  
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
