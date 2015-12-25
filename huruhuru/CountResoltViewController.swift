//
//  CountResoltViewController.swift
//  huruhuru
//
//  Created by 大氣 on 2015/12/25.
//  Copyright © 2015年 Taiki. All rights reserved.
//

import UIKit

class CountResoltViewController: UIViewController {
    
    var app:AppDelegate =
    (UIApplication.sharedApplication().delegate as! AppDelegate)

    @IBOutlet var numberLabel:UILabel!
    @IBOutlet var resoltLabel:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = String("\(app.number)回振るのに")
        resoltLabel.text = String("\(app.up)秒かかりました")
        
        numberLabel.font = UIFont.systemFontOfSize(30)
        resoltLabel.font = UIFont.systemFontOfSize(30)
        numberLabel.textAlignment = .Right
        resoltLabel.textAlignment = .Right
        // Do any additional setup after loading the view.
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
