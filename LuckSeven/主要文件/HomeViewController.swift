//
//  HomeViewController.swift
//  LuckSeven
//
//  Created by Chan_Sir on 2019/12/22.
//  Copyright © 2019 LuckSeven. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit

class HomeViewController: SuperViewController {
    
    
    
    
    /// MARK 添加子控件
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "微动天下科技"
        self.setupSubViews()
        self.addContrains()
        self.handleBuness()
    }
    
    override func setupSubViews() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "成员", style: .done, target: self, action: #selector(pushToLocalImageController))
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.purple], for: .normal)
    }
    
    override func addContrains() {
        
    }
    
    override func handleBuness() {
        
    }
    
    @objc func pushToLocalImageController() -> Void {
        let localVC: LocalmageViewController = LocalmageViewController()
        self.navigationController?.pushViewController(localVC, animated: true)
    }

}
