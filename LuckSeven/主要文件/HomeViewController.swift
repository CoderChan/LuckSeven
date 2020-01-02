//
//  HomeViewController.swift
//  LuckSeven
//
//  Created by Chan_Sir on 2019/12/22.
//  Copyright © 2019 LuckSeven. All rights reserved.
//

import UIKit
import YYKit

class HomeViewController: SuperViewController {
    
    
    /// MARK 添加子控件
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "微动天下·2020·幸运年会"
        self.navigationItem.titleView = UIView()
        self.setupSubViews()
        self.addContrains()
        self.handleBuness()
    }
    
    override func setupSubViews() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "成员", style: .done, target: self, action: #selector(pushToLocalImageController))
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.black], for: .highlighted)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: self.title, style: .done, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.black], for: .highlighted)
        
    }
    
    override func handleBuness() {
        let button: UIButton = UIButton(type: .custom)
        button.backgroundColor = .red
        button.frame = CGRect(x: 100, y: 100, width: 150, height: 50)
        button.addBlock(for: .touchUpInside) { [weak self] (sender) in
            let luck: LuckViewController = LuckViewController()
            let nav: RootNavigationController = RootNavigationController(rootViewController: luck)
            self?.present(nav, animated: true, completion: nil)
        }
        self.view.addSubview(button)
    }
    
    @objc func pushToLocalImageController() -> Void {
        let localVC: LocalmageViewController = LocalmageViewController()
        self.navigationController?.pushViewController(localVC, animated: true)
    }

}

