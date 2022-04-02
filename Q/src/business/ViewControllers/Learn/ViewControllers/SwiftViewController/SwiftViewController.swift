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
        let view = UIView.init(frame:CGRect())
        view.backgroundColor = UIColor.init(hexString: "#423421")
        return view;
    }()
    
    override func loadView() {
        super.loadView()
        self.addSubview(self.container)
        self.container.snp.makeConstraints({ make in
            make.size.equalTo(self.view)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}
