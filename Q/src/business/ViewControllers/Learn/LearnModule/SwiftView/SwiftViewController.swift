//
//  SwiftViewController.swift
//
//  Created by XQ on 2022/4/2.
//

import UIKit
import SnapKit

class SwiftViewController : BaseViewController {
    
    override class func scheme() -> String {
        return "q://vc/swift";
    }
    
    lazy var container: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "#423421")
        return view;
    }()
   
    override func setupViews() {
        super.setupViews();
        self.addSubview(self.container)
        self.container.snp.makeConstraints({ make in
            make.center.equalTo(self.view)
            make.size.equalTo(self.view)
        })
    }
    
}
