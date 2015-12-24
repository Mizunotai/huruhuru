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
    
    //    var dataX : Float!
    //    var dataY : Double!
    //    var dataZ : Double!
    //    var dataX2 : Double!
    //    var dataY2 : Double!
    //    var dataZ2 : Double!
    //
    //    var speedX :Double!
    //    var speedY :Float!
    //    var speedZ :Float!
    
    var x:Float = 0
    var y:Float = 0
    var z:Float = 0
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        /* CMMotionManagerプロパティに加速度センサーを使う設定する */
        // 加速度センサーで値を取得する間隔を設定する
        motionManager.accelerometerUpdateInterval = 0.1
        
        // 値取得時にしたい処理を作成
        let accelerometerHandler:CMAccelerometerHandler = {
            (data: CMAccelerometerData?, error: NSError?) -> Void in
            
            // 取得した値をコンソールに表示
            //            print("x: \(data!.acceleration.x) y: \(data!.acceleration.y) z: \(data!.acceleration.z)")
            
            //                    self.dataX = Float (data!.acceleration.x)
            //                    NSLog("%f", (self.dataX)!)
            //                   var now = NSDate()
            var now = NSData()
            var time = NSDate().timeIntervalSinceDate(now)
            
            NSLog("たいむ:%f", now)
            var spe :Float =
            abs(Float(data!.acceleration.x)) + abs(Float(data!.acceleration.y)) + abs(Float(data!.acceleration.z))
           
            var ed :Float = self.x + self.y + self.z
            
            var speed :Float = ((Float(spe)) - (Float(ed))) / (Float(time)) * 10000
            
            NSLog("Speed:%f", speed)
            // }
            self.x = Float ((data?.acceleration.x)!)
            self.y = Float ((data?.acceleration.y)!)
            self.z = Float ((data?.acceleration.z)!)
            
        }
        
        /* 加速度センサーを開始する */
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: accelerometerHandler)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    func updateAccelerationData(data: CMAcceleration) {
    
    //       print("x = \(Int(data.x)), y = \(Int(data.y)), z = \(Int(data.z))")
    
    //let isShaken = self.x != Int(data.x) || self.y != Int(data.y) || self.z != Int(data.z)
    
    // if isShaken {
    // シェイクされたときの処理
    //            count++
    
    
    
    //            let formatter = NSDateFormatter()
    //            formatter.dateFormat = "HH:mm:ss"
    //            let string = formatter.stringFromDate(now)
    //            print("回数 = \(count) ")
    //            if self.mLastTime == nil {
    //                self.mLastTime = now
    //            }
    //            var speed : Int = abs(Int(data.x) + Int(data.y) + Int(data.z) - self.x - self.y - self.z)/time*10000
    //    var speed :Float = (abs(Float(data.x)) + abs(Float(data.y)) + abs(Float(data.z)) - self.x - self.y - self.z) / time * 10000
    //
    //            var spe :Float = abs(Float(data.x)) + abs(Float(data.y)) + abs(Float(data.z))
    //
    //            var ed :Float = self.x + self.y + self.z
    //
    //            var speed :Float = ((Float(spe)) - (Float(ed))) / (Float(time) * 10000)
    //
    //           NSLog("Speed:%f", speed)
    //       // }
    //        self.x = Float (data.x)
    //        self.y = Float (data.y)
    //        self.z = Float (data.z)
    //    }
    
}





