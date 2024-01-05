//
//  ScrollViewPopup.swift
//
//  Created by XQ on 2024/1/5.
//

import UIKit
import RxCocoa
import RxSwift
import Stevia

@objc(ScrollViewPopupCallback)
@objcMembers
public class ScrollViewPopupCallback: PopupCallback {
    /// 配置头部
    public var configTopBar: ((UIView) -> Void)?
    /// 配置分隔符
    public var configsSeperator: ((UIView) -> Void)?
    /// 配置取消按钮
    public var configCancelButton: ((UIButton) -> Void)?
    /// 配置底部
    public var configBottomBar: ((UIView) -> Void)?
}

@objc(ScrollViewPopupConfig)
@objcMembers
public class ScrollViewPopupConfig: PopupConfig {
    public var scrollView: UIScrollView = UIScrollView()
    public private(set) var callback: ScrollViewPopupCallback = ScrollViewPopupCallback()
}

@objc(ScrollViewPopup)
class ScrollViewPopup: Popup {
    
    private var config: ScrollViewPopupConfig
    
    private lazy var topBar: UIView = {
        let view: UIView = UIView()
        view.isHidden = true
        config.callback.configTopBar?(view)
        return view
    }()

    private lazy var scrollView: UIScrollView = {
        let view: UIScrollView = config.scrollView
        return view
    }()
    
    private lazy var seperator: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        config.callback.configsSeperator?(view)
        return view
    }()
    
    private lazy var cancelButton: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        let font = UIFont.systemFont(ofSize: 16)
        button.setTitle("取消", for: .normal)
        button.titleLabel?.font = font
        _ = button.rx.controlEvent(.touchUpInside)
            .take(until: button.rx.deallocated)
            .subscribe { [weak self] _ in
                self?.hide()
            }
        config.callback.configCancelButton?(button)
        return button
    }()
    
    private lazy var bottomBar: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .white
        config.callback.configBottomBar?(view)
        return view
    }()
    
    public init(_ popupConfig: PopupConfig, with config: ScrollViewPopupConfig) {
        self.config = config
        super.init(popupConfig)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ScrollViewPopup {
    
    internal override func setupViews() {
        container.addArrangedSubview(topBar)
        container.addArrangedSubview(scrollView)
        container.addArrangedSubview(seperator)
        container.addArrangedSubview(cancelButton)
        container.addArrangedSubview(bottomBar)
        super.setupViews()
    }
    
    internal override func layoutViews() {
        topBar.height(20)
        scrollView.height(>=0)
        seperator.height(8)
        cancelButton.height(60)
        bottomBar.height(UIApplication.shared.window?.safeAreaInsets.bottom ?? 0)
        super.layoutViews()
    }
}
