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
    


    var y:Float = 0

    var count = 0
    @IBOutlet var label:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        /* CMMotionManagerプロパティに加速度センサーを使う設定する */
        // 加速度センサーで値を取得する間隔を設定する
        motionManager.accelerometerUpdateInterval = 0.1
        
        // 値取得時にしたい処理を作成
        let accelerometerHandler:CMAccelerometerHandler = {
            (data: CMAccelerometerData?, error: NSError?) -> Void in
            

            self.y = Float ((data?.acceleration.y)!)
//            self.z = Float ((data?.acceleration.z)!)
            if self.y >= 3 || self.y <= -3{
                self.count++
                NSLog("%d", self.count)
                self.label.text = String(self.count)
            }

        }
        
        /* 加速度センサーを開始する */
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: accelerometerHandler)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}





