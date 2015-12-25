//
//  TimeResoltViewController.swift
//  huruhuru
//
//  Created by 大氣 on 2015/12/25.
//  Copyright © 2015年 Taiki. All rights reserved.
//

import UIKit

class TimeResoltViewController: UIViewController {
    
    var app:AppDelegate =
    (UIApplication.sharedApplication().delegate as! AppDelegate)

    @IBOutlet var timeLable:UILabel!
    @IBOutlet var resoltLable:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timeLable.text = String("\(app.moto)秒間に")
        resoltLable.text = String("\(app.count)回振りました")
        timeLable.textAlignment = .Right
        resoltLable.textAlignment = .Right
        timeLable.font = UIFont.systemFontOfSize(30)
        timeLable.font = UIFont.systemFontOfSize(30)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
