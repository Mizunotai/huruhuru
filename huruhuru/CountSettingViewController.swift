//
//  CountSettingViewController.swift
//  huruhuru
//
//  Created by 大氣 on 2015/12/24.
//  Copyright © 2015年 Taiki. All rights reserved.
//

import UIKit



class CountSettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var pickers: UIPickerView!
    var itiArray:[Int] = ([Int])(0...9)
    var juArray:[Int] = ([Int])(0...9)
    var hyakuArray:[Int] = ([Int])(0...9)
//    var number:Int!
    var iti,ju,hyaku : Int!
//    @IBOutlet var button:UIButton!
    // AppDelegateクラスのメンバー変数を参照する
    var app:AppDelegate =
    (UIApplication.sharedApplication().delegate as! AppDelegate)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iti = 0
        ju = 0
        hyaku = 0
        
        pickers.dataSource = self
        pickers.delegate = self

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //表示列
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    //表示個数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if (component == 0){
            return hyakuArray.count
        }else if (component == 1){
            return juArray.count
        }else if (component == 2){
            return itiArray.count
        }
        return 0
    }
    //表示内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //        //配列の値を文字列に変換してPickerのtitleに使う
        //        return String(dataArray[row]) + "年"
        if component == 0{
            return String(hyakuArray[row])
        }else if component == 1{
            return String(juArray[row])
        }else {
            return String(itiArray[row])
        }
    }
        //選択時
        func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            if (component == 0){
                print("hyaku列: \(row)")
                print("hyaku値: \(hyakuArray[row])")
                hyaku = hyakuArray[row]*100
                print(hyaku)
            }else if (component == 1){
                print("ju列: \(row)")
                print("ju値: \(juArray[row])")
                ju = juArray[row]*10
                print(ju)
            }else if (component == 2){
                print("iti列: \(row)")
                print("iti値: \(itiArray[row])")
                iti = itiArray[row]
                print(iti)
            }
            
            app.number = iti + ju + hyaku
            
            
           
            print(app.number)
        }
        
        
//    @IBAction func startButton() {
//        
//        
//    }
//    
    
        /*
        // MARK: - Navigation
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        }
        */
    }

