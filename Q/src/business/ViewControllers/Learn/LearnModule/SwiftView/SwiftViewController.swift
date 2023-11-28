//
//  SwiftViewController.swift
//
//  Created by XQ on 2022/4/2.
//

import UIKit
import SnapKit
import SwiftUI

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
        self.addSubview(self.container)
        self.container.snp.makeConstraints({ make in
            make.center.equalTo(self.view)
            make.size.equalTo(self.view)
        })
    }
    
}
