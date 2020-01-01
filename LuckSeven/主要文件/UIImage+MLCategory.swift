//
//  UIImage+MLCategory.swift
//  LuckSeven
//
//  Created by Chan_Sir on 2020/1/1.
//  Copyright © 2020 LuckSeven. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    /// 根据颜色和尺寸生成一张图片
    /// - Parameters:
    ///   - color: 颜色
    ///   - size: 尺寸
    static func imageWithColor(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        var newSize: CGSize = size
        if newSize.width <= 0 {
            newSize.width = 1
        }
        if newSize.height <= 0 {
            newSize.height = 1
        }
        let rect: CGRect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
}
