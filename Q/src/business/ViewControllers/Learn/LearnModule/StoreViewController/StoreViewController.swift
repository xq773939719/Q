//
//  StoreViewController.swift
//
//  Created by XQ on 2023/12/13.
//

import UIKit
import SnapKit
import SwiftUI

class ServiceStore: QServiceStore {
    
    var dataService: DataService { resolve(DataService.self) }
    var layoutService: LayoutService { resolve(LayoutService.self) }
    
    public required init(_ container: UIViewController) {
        super.init()
        layoutService.container = container
    }
    
    public required init() {
        super.init()
    }
}

class StoreViewController : BaseViewController {
    
    override class func scheme() -> String {
        return "q://vc/store";
    }
    
    internal lazy var store = ServiceStore(self)

    
}
