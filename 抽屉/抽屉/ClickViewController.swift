//
//  ClickViewController.swift
//  抽屉
//
//  Created by 张明磊 on 2018/11/26.
//  Copyright © 2018年 张明磊. All rights reserved.
//

import UIKit

class ClickViewController: UIViewController {

    var text : String?
    var viewTitle : String?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    init(text : String , title : String) {
        super.init(nibName: nil, bundle: nil)
        self.text = text
        self.viewTitle = title
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))        
        if let text = self.text {
            label.text = text
        }else{
            label.text = "click"
        }
        label.sizeToFit()
        label.center = self.view.center
        self.view.addSubview(label)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.view.backgroundColor = UIColor.white
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        if let titleText = self.viewTitle {
            title.text = titleText
        }else{
            title.text = "click"
        }
        title.textColor = UIColor.white
        self.navigationItem.titleView = title
        
        self.navigationController?.navigationBar.barTintColor = UIColor.blue
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        if(title.text == "view1"){
            let leftBtn = UIBarButtonItem(title: "抽屉", style: .plain, target: self, action:#selector(openLeftView))
            leftBtn.tintColor = UIColor.white
            self.navigationItem.leftBarButtonItem = leftBtn
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func openLeftView(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "openLeftView"), object: nil)
    }

}
