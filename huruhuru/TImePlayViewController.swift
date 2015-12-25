//
//  TImePlayViewController.swift
//  huruhuru
//
//  Created by 大氣 on 2015/12/25.
//  Copyright © 2015年 Taiki. All rights reserved.
//

import UIKit
import CoreMotion
import AudioToolbox

class TImePlayViewController: UIViewController {
    var app:AppDelegate =
    (UIApplication.sharedApplication().delegate as! AppDelegate)

    let motionManager = CMMotionManager()//CMMotionManagerプロパティの追加
    var y:Float = 0
   

    @IBOutlet var label :UILabel!
    var timer :NSTimer!
    var countDwon = 3
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        label.text = String(countDwon)
        app.moto = app.time
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update (){
        countDwon = countDwon - 1
        label.text = String(countDwon)
        if countDwon == 0{
            timer.invalidate()
            label.text = String("振れ！！！")
            self.hure()
        }
        }
    func hure () {
        //タイマーを作る.
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("countdown"), userInfo: nil, repeats: true)
        
        
        /* CMMotionManagerプロパティに加速度センサーを使う設定する */
        // 加速度センサーで値を取得する間隔を設定する
        motionManager.accelerometerUpdateInterval = 0.1
        
        // 値取得時にしたい処理を作成
        let accelerometerHandler:CMAccelerometerHandler = {
            (data: CMAccelerometerData?, error: NSError?) -> Void in
            
            self.y = Float ((data?.acceleration.y)!)
            if self.y >= 2 || self.y <= -2{
                self.app.count++
                NSLog("%d", self.app.count)
                
            }
            
        }
        /* 加速度センサーを開始する */
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: accelerometerHandler)

    }
    
    func countdown () {
        app.time = app.time - 1
        if app.time == 0 {
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            timer.invalidate()
            let targetViewController = self.storyboard!.instantiateViewControllerWithIdentifier( "time" )
            self.presentViewController( targetViewController, animated: true, completion: nil)
        }
    }
    
    /*
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
