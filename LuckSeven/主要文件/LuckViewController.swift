//
//  LuckViewController.swift
//  LuckSeven
//
//  Created by sks on 2020/1/2.
//  Copyright © 2020 LuckSeven. All rights reserved.
//

import UIKit
import SnapKit
import YYKit.UIImage_YYAdd

class LuckViewController: SuperViewController {
    
    var array: [LocalmageModel]!
    var luckView: YoungSphere!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.array = LocalmageManager.localArray()
        self.setupSubViews()
    }
    
    override func setupSubViews() {
        
        // 背景图
        let image: UIImage = (UIImage(named: "home_bg")?.ks_imageByBlurLight())!
        let backImgView: UIImageView = UIImageView(image: image)
        backImgView.frame = self.view.bounds
        self.view.addSubview(backImgView)
        
        // 抽奖的
        self.luckView = YoungSphere(frame: CGRect(x: 0, y: 64, width: self.view.width, height: self.view.width))
        var tempArray: [UIImageView] = NSMutableArray() as! [UIImageView]
        for (_, value) in self.array.enumerated() {
            let iconName: String = value.name
            let imgView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
            imgView.image = UIImage(named: iconName)
            self.luckView.addSubview(imgView)
            tempArray.append(imgView)
        }
        self.luckView.setCloudTags(tempArray)
        self.view.addSubview(self.luckView)
        
        // 退出按钮
        let returnImage: UIImage = UIImage(named: "return_btn")!
        let returnButton: UIButton = UIButton(type: .custom)
        returnButton.setBackgroundImage(returnImage, for: .normal)
        returnButton.setBackgroundImage(returnImage, for: .highlighted)
        returnButton.addBlock(for: .touchUpInside) { (sender) in
            self.luckView.timerStop()
            let animation: CATransition = CATransition()
            animation.duration = 0.35
            animation.type = CATransitionType(rawValue: "cube")
            animation.subtype = .fromLeft
            self.view.window?.layer.add(animation, forKey: nil)
            self.navigationController?.dismiss(animated: false, completion: nil)
        }
        self.view.addSubview(returnButton)
        returnButton.snp_makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-30)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
    }
    
    override func handleBuness() {
        
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.resultLuck()
    }
    
    func resultLuck() {
        let array: [LocalmageModel] = LocalmageManager.localArray()
        let randomIndex: Int = Int(arc4random_uniform(UInt32(array.count)))
        print("randomIndex = \(randomIndex)")
        let model: LocalmageModel = array[randomIndex]
        let resultView: LuckResultViewController = LuckResultViewController(iconName: model.name)
        let nav: RootNavigationController = RootNavigationController(rootViewController: resultView)
        self.present(nav, animated: false, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
}
