//
//  ViewController.swift
//  aniTime
//
//  Created by 张聪 on 2020/6/18.
//  Copyright © 2020 李煜. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func aniWithParams(v:UIView,duration:CFTimeInterval,repeatDuration:CFTimeInterval,beginTime:CFTimeInterval,autoReverse:Bool,repeatCount:Float) {
        let ani = CABasicAnimation(keyPath: "position.x")
        ani.toValue = 300
        ani.duration = duration
        ani.repeatDuration = repeatDuration
        ani.beginTime = CACurrentMediaTime() + beginTime
        ani.autoreverses = autoReverse
        ani.repeatCount = repeatCount
        v.layer.add(ani, forKey: nil)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        testMethod();
    }
    func testMethod() {
        if view.subviews.count>0 {
            view.subviews.forEach { (sb) in
                sb.removeFromSuperview()
            }
        }
        
        let colors: [UIColor] = [.red,.black,.blue,.brown,.darkGray,.purple]
        //duration repeatDuration beginTime autoReverse repeatCount
        let t1 = (1.5,0.0,0.0,false,Float(0))//默认
        let t2 = (1.5,0.0,1.5,false,Float(0))//1s之后开始动画
        let t3 = (1.5,0.0,0.0,true,Float(0))//回转

        let tt4 = (1.5,0.0,0.0,false,Float(2.0))//repeatCount
        
        let t41 = (1.5,1.0,0.0,false,Float(0))//repeatDuration
        let t42 = (1.5,1.5,0.0,false,Float(0))
        let t43 = (1.5,2.0,0.0,false,Float(0))
        
        let t51 = (0.5,0.0,0.0,true,Float(2.5))
        let arr = [t1,t3,tt4,t51]
        for index in 0..<arr.count {
            let y = index*50+100
            let v = UIView(frame: CGRect(x: 50, y: y, width: 50, height: 50))
            view.addSubview(v)
            v.backgroundColor = colors[index]
            let tuple = arr[index]
            aniWithParams(v: v, duration: CFTimeInterval(tuple.0), repeatDuration: CFTimeInterval(tuple.1), beginTime: CFTimeInterval(tuple.2), autoReverse: Bool(tuple.3), repeatCount: Float(tuple.4))
        }
    }
}

