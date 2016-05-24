//
//  ViewController.swift
//  blur
//
//  Created by Tanfanfan on 16/5/24.
//  Copyright © 2016年 Tanfanfan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.frame
        view.addSubview(blurEffectView)
        
        
        let vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
        let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyEffectView.frame = view.frame
        
        let label = UILabel()
        label.text = "Vibrant Label!!!"
        label.font = UIFont.systemFontOfSize(40.0)
        label.sizeToFit()
        label.center = view.center
        vibrancyEffectView.contentView.addSubview(label)
        
        blurEffectView.contentView.addSubview(vibrancyEffectView)
        
        
        let btn = UIButton()
         btn.setTitle("改变底图", forState: .Normal)
        btn.sizeToFit()
        btn.center = view.center
        btn.center.y -= 30
        btn.addTarget(self, action: #selector(ViewController.updateBackImage(_:)), forControlEvents: .TouchUpInside)
        vibrancyEffectView.contentView.addSubview(btn)
    }

    func updateBackImage(sender: UIButton) {
        sender.selected = !sender.selected
        imageView.image = sender.selected ? UIImage(named: "WeChat_1464082682") : UIImage(named: "WeChat_1464082679")
    }


}

