//
//  Template.swift
//  Q
//
//  Created by XQ on 2022/4/6.
//

import UIKit
import SnapKit

class TemplateViewController: BaseViewController {
    
    override class func scheme() -> String {
        return ""
    }
    
    lazy var container: UIView = {
        let view = UIView.init(frame: CGRect())
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        self.addSubview(self.container)
        container.snp.makeConstraints { make in
            make.size.equalTo(self.view)
        }
    }
    
}
