//
//  MainViewController.swift
//  抽屉
//
//  Created by 张明磊 on 2018/11/26.
//  Copyright © 2018年 张明磊. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.white
        
        let view1 = ClickViewController(text: "view1", title: "view1")
        view1.tabBarItem.title = "view0"
        view1.tabBarItem.image = UIImage(named: "github60")
        let view2 = ClickViewController(text: "view2", title: "view2")
        view2.tabBarItem.title = "view1"
        view2.tabBarItem.image = UIImage(named: "github160")
        let view3 = ClickViewController(text: "view3", title: "view3")
        view3.tabBarItem.title = "view2"
        view3.tabBarItem.image = UIImage(named: "more")
        
        let nc1 = UINavigationController(rootViewController: view1)
        nc1.navigationBar.barTintColor = UIColor.blue
        nc1.navigationBar.tintColor = UIColor.white
        let nc2 = UINavigationController(rootViewController: view2)
        nc2.navigationBar.barTintColor = UIColor.blue
        nc2.navigationBar.tintColor = UIColor.white
        let nc3 = UINavigationController(rootViewController: view3)
        nc3.navigationBar.barTintColor = UIColor.blue
        nc3.navigationBar.tintColor = UIColor.white
        
        self.viewControllers = [nc1,nc2,nc3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
}
