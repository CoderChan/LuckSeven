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
        self.modalPresentationStyle = .fullScreen
    }
    
    func setupOptions() {
        
        // 标题设置
        let titleFont: UIFont = UIFont.boldSystemFont(ofSize: 18)
        let titleColor: UIColor = .black
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: titleFont, NSAttributedString.Key.foregroundColor: titleColor]
        
        // 背景色
        self.navigationBar.barTintColor = .white
        // 左右侧颜色
        self.navigationBar.tintColor = .black
        
        // 去掉导航栏的线
//        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationBar.shadowImage = UIImage()
        // 控制导航栏是否隐藏
        self.navigationBar.isTranslucent = false
        self.navigationBar.barStyle = .default
        
        print("我的导航栏高度 = \(self.navigationBar.height)")
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(backAction))
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
