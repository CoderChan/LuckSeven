//
//  RootNavigationController.swift
//  LuckSeven
//
//  Created by Chan_Sir on 2019/12/22.
//  Copyright © 2019 LuckSeven. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupOptions()
    }
    
    func setupOptions() {
//        let titleFont: UIFont = UIFont.boldSystemFont(ofSize: 18)
//        let titleColor: UIColor = .red
        
//        self.navigationBar.titleTextAttributes
        self.navigationBar.barTintColor = .white
        self.navigationBar.tintColor = .red
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = false // 控制导航栏是否隐藏
        self.navigationBar.barStyle = .default
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(backAction))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc func backAction() {
        self .popViewController(animated: true)
    }

}
