//
//  Popup.swift
//
//  Created by XQ on 2024/1/4.
//

import UIKit
import RxCocoa
import RxSwift
import Stevia

@objc(PopupCallback)
@objcMembers
public class PopupCallback: NSObject {
    public var onSetupViews: (() -> Void)?
    public var onLayoutViews: (() -> Void)?
    public var onWillShow: (() -> Void)?
    public var onDidShow: (() -> Void)?
    public var onWillHide: (() -> Void)?
    public var onDidHide: (() -> Void)?
}

@objc(PopupConfig)
@objcMembers
public class PopupConfig: NSObject {
    public var animateDuration: TimeInterval = 0.375
    public var backgroundColor: UIColor = .init(white: 0, alpha: 0.5)
    public private(set) var popupCallback: PopupCallback = PopupCallback()
}

@objc(Popup)
public class Popup : UIViewController {
    
    private let config: PopupConfig
    
    private lazy var maskBackground: UIControl = {
        let view: UIControl = UIControl()
        _ = view.rx.controlEvent(.touchUpInside)
            .take(until: self.rx.deallocated)
            .subscribe { [weak self] _ in
            self?.hide()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public private(set) lazy var container: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    @objc
    public init(_ popupConfig: PopupConfig) {
        self.config = popupConfig
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
        initViewState()
    }
    
}

extension Popup {
    
    @objc
    public func show(in container: UIViewController) {
        container.present(self, animated: false)
        self.willShow()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(0)) {
            UIView.animate(withDuration: self.config.animateDuration) {
                self.onShow()
            } completion: { _ in
                self.didShow()
            }
        }
    }
    
    @objc
    public func hide() {
        self.willHide()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(0)) {
            UIView.animate(withDuration: self.config.animateDuration) {
                self.onHide()
            } completion: { _ in
                self.dismiss(animated: false)
                self.didHide()
            }
        }
    }
}

extension Popup {
    
    @objc
    internal func setupViews() {
        view.addSubview(maskBackground)
        view.addSubview(container)
        config.popupCallback.onSetupViews?()
    }
    
    @objc
    internal func layoutViews() {
        maskBackground.fillContainer()
        view.layout(
            (>=0),
            |-0-container-0-|,
            0
        )
        config.popupCallback.onLayoutViews?()
        view.layoutIfNeeded()
    }
    
    private func initViewState() {
        maskBackground.backgroundColor = .clear
        container.transform = CGAffineTransformMakeTranslation(0, container.size.height)
    }
    
    private func endViewState() {
        maskBackground.backgroundColor = config.backgroundColor
        container.transform = CGAffineTransformIdentity
    }
}

extension Popup {
    
    private func willShow() {
        config.popupCallback.onWillShow?()
    }
    
    private func onShow() {
        endViewState()
    }
    
    private func didShow() {
        config.popupCallback.onDidShow?()
    }
    
    private func willHide() {
        config.popupCallback.onWillHide?()
    }
    
    private func onHide() {
        initViewState()
    }
    
    private func didHide() {
        config.popupCallback.onDidHide?()
    }
    
}
