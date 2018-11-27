//
//  ViewController.swift
//  抽屉
//
//  Created by 张明磊 on 2018/11/26.
//  Copyright © 2018年 张明磊. All rights reserved.
//

import UIKit

enum NowState {
    case open
    case close
}

class ViewController: UIViewController {
    
    var leftViewController : LeftViewController?
    var mainViewController : MainViewController?
    var state = NowState.close
    
    init(leftController : LeftViewController , mainController : MainViewController){
        super.init(nibName: nil, bundle: nil)
        self.leftViewController = leftController
        self.mainViewController = mainController
        
        view.addSubview(mainController.view)
        view.addSubview(leftController.view)
        
        addChildViewController(mainController)
        addChildViewController(leftController)

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(openLeftView), name: NSNotification.Name(rawValue: "openLeftView"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(clickPush), name: NSNotification.Name(rawValue: "clickPush"), object: nil)
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(viewPan(sender:)))
        self.mainViewController?.view.addGestureRecognizer(gesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        leftViewController?.view.transform = CGAffineTransform(translationX: -275, y: 0)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    }
    
    @objc func viewPan(sender: UIPanGestureRecognizer) {
        
        let x = sender.translation(in: self.mainViewController?.view).x
        
        guard let frame = self.leftViewController?.view.frame,
            let frame2 = self.mainViewController?.view.frame else{
                return;
        }

        if(sender.state == UIGestureRecognizerState.changed){
            if(self.state == NowState.close && x-275 >= -275){
                mainViewController?.view.transform = CGAffineTransform(translationX: x, y: 0)
                leftViewController?.view.transform = CGAffineTransform(translationX: x-275, y: 0)
                print("x:\(x)--main:\(frame2.origin.x)--left:\(frame.origin.x)")
            }else if(self.state == NowState.open && x+275 <= 275){
                mainViewController?.view.transform = CGAffineTransform(translationX: x+275, y: 0)
                leftViewController?.view.transform = CGAffineTransform(translationX: x, y: 0)
                print("x:\(x)--main:\(frame2.origin.x)--left:\(frame.origin.x)")
            }
            
        }else if(sender.state == UIGestureRecognizerState.ended || sender.state == UIGestureRecognizerState.cancelled || sender.state == UIGestureRecognizerState.failed){
            UIView.animate(withDuration: 0.7) {
                if(x >= 100 || (x >= -100 && x <= 0)){
                    self.state = NowState.open
                    self.mainViewController?.view.transform = CGAffineTransform(translationX: 275, y: 0)
                    self.leftViewController?.view.transform = CGAffineTransform(translationX: 0, y: 0)
                }else{
                    self.state = NowState.close
                    self.mainViewController?.view.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.leftViewController?.view.transform = CGAffineTransform(translationX: -275, y: 0)
                }
            }
            if(sender.state == UIGestureRecognizerState.ended){
                print("end")
            }else if(sender.state == UIGestureRecognizerState.cancelled){
                print("cancell")
            }else if(sender.state == UIGestureRecognizerState.failed){
                print("failed")
            }
            print("x:\(x)--main:\(frame2.origin.x)--left:\(frame.origin.x)")
        }
        
    }
    
    @objc func openLeftView(){
        UIView.animate(withDuration: 0.7) {
            if(self.state == NowState.close){
                self.mainViewController?.view.transform = CGAffineTransform(translationX: 275, y: 0)
                self.leftViewController?.view.transform = CGAffineTransform(translationX: 0, y: 0)
                self.state = NowState.open
            }else{
                self.mainViewController?.view.transform = CGAffineTransform(translationX: 0, y: 0)
                self.leftViewController?.view.transform = CGAffineTransform(translationX: -275, y: 0)
                self.state = NowState.close
            }
        }
    }
    
    
    @objc func clickPush(){
        if(state == NowState.open){
            UIView.animate(withDuration: 0.7, animations: {
                if(self.state == NowState.close){
                    self.mainViewController?.view.transform = CGAffineTransform(translationX: 275, y: 0)
                    self.leftViewController?.view.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.state = NowState.open
                }else{
                    self.mainViewController?.view.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.leftViewController?.view.transform = CGAffineTransform(translationX: -275, y: 0)
                    self.state = NowState.close
                }
            }, completion: { (stats) in
                let vc = ClickViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            })
        }
        
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

}

