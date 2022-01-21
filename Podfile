install! 'cocoapods'

workspace 'Q'
source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

use_frameworks!
inhibit_all_warnings!

develop_pods_path = './DevelopPods'

flutter_module_path = develop_pods_path
load File.join(flutter_module_path, 'flutter_module', '.ios', 'Flutter', 'podhelper.rb')


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

  # 响应式
  pod 'ReactiveObjC'

  # 图片
  pod 'SDWebImage'

  # 动画
  pod 'lottie-ios', '<= 2.5.3'

  # 数据解析
  pod 'JSONModel'

  # 数据库
  pod 'FMDB'

  # YYKit
  pod 'YYKit'
  # pod 'YYModel'
  # pod 'YYText'
  # pod 'YYCache'
  # pod 'YYImage'
  # pod 'YYWebImage'

  # FaceBook SDK
  pod 'FBSDKCoreKit'
  
  # Firebase SDK
  pod 'Firebase'
  
  # 日志框架
  pod 'CocoaLumberjack', '<= 3.0'
  
  # gRPC
  # pod 'gRPC'
  # pod 'gRPC-Core'
  # pod 'gRPC-ProtoRPC'

  # 压缩解压
  pod 'SSZipArchive'

  # 弹窗
  pod 'Toast'

  # JS热修复 交互
  # pod 'JSPatch'
  # pod 'WebViewJavascriptBridge'

  # 正则表达式
  pod 'RegexKitLite-NoWarning'

  #------ 调试组件 ------#
  pod 'LookinServer', :configurations => ['Debug']
  pod 'FLEX', :configurations => ['Debug']   # Xcode界面调试工具

end

#------ 开发组件 ------#
# !!! 不要忘记注释相应的模块
def DevelopModule
  # 视频播放
  pod 'QIJKPlayer', :path => './DevelopPods/QIJKPlayer'
  
end

# Pods for Q
target 'Q' do
  # Comment the next line if you don't want to use dynamic frameworks
  # Flutter
  install_all_flutter_pods(flutter_module_path)
  DevelopModule()
  ThridPartyModules()
  BaseModules()
  CommonModules()
  BusinessModules()
end
