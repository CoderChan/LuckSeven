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
        let startImage: UIImage = UIImage(named: "start_run")!
        let startButton: UIButton = UIButton(type: .custom)
        startButton.setBackgroundImage(startImage, for: .normal)
        startButton.setBackgroundImage(startImage, for: .highlighted)
        startButton.addBlock(for: .touchUpInside) { (sender) in
            let luck: LuckViewController = LuckViewController()
            let nav: RootNavigationController = RootNavigationController(rootViewController: luck)
            self.present(nav, animated: false, completion: nil)
            
            let animation: CATransition = CATransition()
            animation.duration = 0.8
            animation.type = CATransitionType(rawValue: "cube")
            animation.subtype = .fromTop
            self.view.window?.layer.add(animation, forKey: nil)
        }
        self.view.addSubview(startButton)
        startButton.snp_makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(110)
            make.height.equalTo(50)
        }
    }
    
    @objc func pushToLocalImageController() -> Void {
        let localVC: LocalmageViewController = LocalmageViewController()
        self.navigationController?.pushViewController(localVC, animated: true)
    }

}

