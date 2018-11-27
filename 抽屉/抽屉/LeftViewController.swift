//
//  LeftViewController.swift
//  抽屉
//
//  Created by 张明磊 on 2018/11/26.
//  Copyright © 2018年 张明磊. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect(x: 0, y: 0, width: 275, height: UIScreen.main.bounds.size.height)
        self.view.backgroundColor = UIColor.lightGray
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        btn.center = self.view.center
        btn.setTitle("click", for: .normal)
        self.view .addSubview(btn)
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func click(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "clickPush"), object: nil)
    }
    
}
