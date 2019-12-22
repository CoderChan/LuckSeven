//
//  RootNavigationController.swift
//  LuckSeven
//
//  Created by Chan_Sir on 2019/12/22.
//  Copyright © 2019 LuckSeven. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    var popDelegate: UIGestureRecognizerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupOptions()
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self
    }
    
    func setupOptions() {
//        let titleFont: UIFont = UIFont.boldSystemFont(ofSize: 18)
//        let titleColor: UIColor = .red
        
//        self.navigationBar.titleTextAttributes
        self.navigationBar.barTintColor = .white
        self.navigationBar.tintColor = .black
        // 去掉导航栏的线
//        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationBar.shadowImage = UIImage()
        // 控制导航栏是否隐藏
        self.navigationBar.isTranslucent = false
        self.navigationBar.barStyle = .default
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "back"), style: .done, target: self, action: #selector(backAction))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc func backAction() {
        self.popViewController(animated: true)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController == self.viewControllers.first {
            self.interactivePopGestureRecognizer?.delegate = self.delegate! as? UIGestureRecognizerDelegate
        } else {
            self.interactivePopGestureRecognizer?.delegate = nil
        }
        
    }

}
