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

#  pod 'QPlayer'

end

#------ 第三方库 ------#
def ThridPartyModules

  # 网络请求
  pod 'AFNetworking'
  pod 'Reachability'

  # 布局
  pod 'Masonry'

  # 响应式
  pod 'ReactiveCocoa'

  # 图片
  pod 'SDWebImage'

  # 动画
  pod 'lottie-ios'

  # 数据解析
  pod 'SwiftyJSON'
  pod 'JSONModel'
  
  # 数据库
  pod 'FMDB'
  
  # YYKit
  pod 'YYKit'
  
  # gRPC
  # pod 'gRPC'
  # pod 'gRPC-Core'
  # pod 'gRPC-ProtoRPC'
  
  # 压缩解压
  pod 'SSZipArchive'
  
  # 弹窗
  pod 'Toast'

  # JS热修复 交互
  pod 'JSPatch'
  pod 'WebViewJavascriptBridge'

  # 正则表达式
  pod 'RegexKitLite-NoWarning'

  #------ 调试组件 ------#
  pod 'LookinServer', :configurations => ['Debug']
  pod 'FLEX', :configurations => ['Debug']   # Xcode界面调试工具

end

#------ 开发组件 ------#
# !!! 不要忘记注释相应的模块
def DevelopModules
  
  # 业务层
  pod 'QBusiness', :path => './DevelopPods/QBusiness' # 业务
  
  # Common层
  pod 'QUtil', :path => './DevelopPods/QUtil' # 工具
  pod 'QDevice', :path => './DevelopPods/QDevice' # 设备
  pod 'QFeature', :path => './DevelopPods/QFeature' # 特性
  # Base层
  pod 'QPlayer', :path => './DevelopPods/QPlayer'  # 基础播放
  pod 'QMonitor', :path => './DevelopPods/QMonitor' # 监控
  pod 'QTheme', :path => './DevelopPods/QTheme' # 主题
  pod 'QRouter', :path => './DevelopPods/QRouter' # 路由
  pod 'QNetwork', :path => './DevelopPods/QNetwork' # 网络
  pod 'QFile', :path => './DevelopPods/QFile' # 文件
  pod 'QData', :path => './DevelopPods/QData' # 数据库
  pod 'QLogger', :path => './DevelopPods/QLogger' # 日志
  pod 'QTracer', :path => './DevelopPods/QTracer' # 埋点
  pod 'QBaseKit', :path => './DevelopPods/QBaseKit' # 基础UI
  
  # 框架层
  pod 'QBase', :path => './DevelopPods/QBase' # 基础框架

end

# Pods for Q
target 'Q' do
  # Comment the next line if you don't want to use dynamic frameworks
  # Flutter
  install_all_flutter_pods(flutter_module_path)
  DevelopModules()
  ThridPartyModules()
  BaseModules()
  CommonModules()
  BusinessModules()
end
