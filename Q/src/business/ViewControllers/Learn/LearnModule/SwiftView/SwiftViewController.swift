//
//  SwiftViewController.swift
//
//  Created by XQ on 2022/4/2.
//

import UIKit
import SnapKit
import SwiftUI
import RxCocoa
import RxSwift

class SwiftViewController : BaseViewController {
    
    override class func scheme() -> String {
        return "q://vc/swift";
    }
    
    lazy var container: UIView = {
        let vc = UIHostingController(rootView: SwiftUIView())
        let view = vc.view ?? UIView(frame: .zero)
        return view
    }()
    
    override func setupViews() {
        super.setupViews();
        addSubview(container)
        container.snp.makeConstraints({ make in
            make.center.equalTo(view)
            make.size.equalTo(view)
        })
        let gesture: UITapGestureRecognizer = UITapGestureRecognizer()
        container.addGestureRecognizer(gesture)
        _ = gesture.rx.event
            .take(until: rx.deallocated)
            .subscribe { _ in
                // 弹窗配置
                let popupConfig = PopupConfig()
                popupConfig.popupCallback.onSetupViews = {}
                popupConfig.popupCallback.onLayoutViews = {}
                popupConfig.popupCallback.onWillShow = {}
                popupConfig.popupCallback.onDidShow = {}
                popupConfig.popupCallback.onWillHide = {}
                popupConfig.popupCallback.onDidHide = {}
                
                // 内容配置
                let scrollViewConfig = ScrollViewPopupConfig()
                let vc: ScrollViewPopup = ScrollViewPopup(popupConfig, with: scrollViewConfig)
                
                let titles: [String] =  ["1", "2", "3", "4", "5", "6", "7", "8"]
                let items: [ItemModel] = titles.compactMap { title in
                    let model: ItemModel = ItemModel()
                    model.title = title
                    model.action = {
                        print(title)
                        vc.hide()
                    }
                    return model
                }
                
                scrollViewConfig.callback.configTopBar = { view in
                    view.heightAnchor.constraint(equalToConstant: 4).isActive = true
                }
                scrollViewConfig.scrollView = {
                    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
                    tableView.separatorStyle = .singleLine
                    tableView.estimatedRowHeight = 48
                    tableView.rowHeight = UITableView.automaticDimension
                    tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
                    _ = Observable.just(items)
                        .take(until: tableView.rx.deallocated)
                        .bind(to: tableView.rx.items) { (tableView, row, element) in
                            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))!
                            cell.imageView?.image = element.image
                            cell.textLabel?.text = element.title
                            return cell
                        }
                    _ = tableView.rx.itemSelected
                        .take(until: tableView.rx.deallocated)
                        .subscribe { indexPath in
                            guard indexPath.item >= 0, indexPath.item < items.count else {
                                return
                            }
                            let model = items[indexPath.item]
                            model.action?()
                        }
                    _ = tableView.rx.observe(\.contentSize, options: [.new])
                        .take(until: tableView.rx.deallocated)
                        .subscribe(onNext: { size in
                            tableView.height(min(size.height, 233))
                        })
                    return tableView
                }()
                
                vc.show(in: self)
            }
    }
    
}

public class ItemModel {
    public var image: UIImage?
    public var title: String = ""
    public var action: (() -> Void)?
}
