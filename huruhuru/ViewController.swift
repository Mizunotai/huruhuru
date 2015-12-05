//
//  ViewController.swift
//  huruhuru
//
//  Created by 大氣 on 2015/12/05.
//  Copyright © 2015年 Taiki. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let motionManager = CMMotionManager()//CMMotionManagerプロパティの追加
    var x = 0
    var y = 0
    var z = 0
    var count = 0
    var SHAKE_TIMEOUT : Float = 500.0
    var mLastTime :NSDate!
    var mLastAccel :NSDate!
    override func viewDidLoad() {
        super.viewDidLoad()

  
        self.motionManager.accelerometerUpdateInterval = 1
        self.motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue()) {
            (data, error) in
            dispatch_async(dispatch_get_main_queue()) {
                self.updateAccelerationData(data!.acceleration)
            }
        }
    }
    func updateAccelerationData(data: CMAcceleration) {
        
        print("x = \(Int(data.x)), y = \(Int(data.y)), z = \(Int(data.z))")
        
        let isShaken = self.x != Int(data.x) || self.y != Int(data.y) || self.z != Int(data.z)
        
        if isShaken {
            // シェイクされたときの処理
            count++
           
            var now = NSDate()
            var time = NSDate().timeIntervalSinceDate(now) // 現在時刻と開始時刻の差
            
            
            
//            let formatter = NSDateFormatter()
//            formatter.dateFormat = "HH:mm:ss"
//            let string = formatter.stringFromDate(now)
            print("回数 = \(count) ")
            if self.mLastTime == nil {
                self.mLastTime = now
            }
//            var speed : Float = abs((data.x) + (data.y) + (data.z) - x - y - z) / time * 10000
            

            
        }
        
        self.x = Int(data.x)
        self.y = Int(data.y)
        self.z = Int(data.z)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

