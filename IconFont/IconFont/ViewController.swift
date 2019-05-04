//
//  ViewController.swift
//  IconFont
//
//  Created by MYK on 2019/5/2.
//  Copyright © 2019 MYK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: properties

    @IBOutlet weak var displayLabel: UILabel!

    @IBOutlet weak var displayImageView: UIImageView!

    @IBOutlet weak var compareImageView: UIImageView!


    // MARK: view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // 使用枚举Str
        let attributeStr = MWIconFont.attributedString(fromIconStr: MWFontIcon.yuedufuHuodeIcon.rawValue, size: 50.0, color: UIColor.red)
        displayLabel.attributedText = attributeStr

        // 使用枚举Int
        let attributeStr1 = MWIconFont.attributedString(fromIconInt: MWFontIconInt.yuedufuHuodeIcon.rawValue, size: 50.0, color: UIColor.blue)
        displayLabel.attributedText = attributeStr1

        // 使用枚举Str
        let image =  MWIconFont.image(fromIconStr: MWFontIcon.yuedufuHuodeIcon.rawValue, size: CGSize(width: 30.0, height: 50.0), color: UIColor.cyan, edgeInsets: UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: -10.0))
        displayImageView.image = image

        // 使用枚举Int
        let image1 = MWIconFont.image(fromIconInt: MWFontIconInt.yuedufuHuodeIcon.rawValue, size: CGSize(width: 30.0, height: 50.0), color: UIColor.blue, edgeInsets:  UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: -10.0))
        displayImageView.image = image1


        // 对比image，可以看到图片长宽不同的影响
        let compareImage = MWIconFont.image(fromIconStr: MWFontIcon.yuedufuHuodeIcon.rawValue, size: CGSize(width: 30.0, height: 30.0), color: UIColor.blue)
        compareImageView.image = compareImage

    }


    // MARK: action



    // MARK: utils


    // MARK: other



}

