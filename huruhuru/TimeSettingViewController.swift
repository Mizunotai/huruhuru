//
//  TimeSettingViewController.swift
//  huruhuru
//
//  Created by 大氣 on 2015/12/25.
//  Copyright © 2015年 Taiki. All rights reserved.
//

import UIKit

class TimeSettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet var picker : UIPickerView!
    var secondArray:[Int] = ([Int])(1...60)
    
    var app:AppDelegate =
    (UIApplication.sharedApplication().delegate as! AppDelegate)

    override func viewDidLoad() {
        super.viewDidLoad()

        picker.dataSource = self
        picker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //表示列
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    
    }
    
    //表示個数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
    
        return secondArray.count
    }
    
    //表示内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return String("\(secondArray[row])秒")
    }
    //選択時
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        app.time = row+1
        print(app.time)
        
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
