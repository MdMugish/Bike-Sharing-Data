//
//  SelectDayVC.swift
//  iOS-App-with-Bike-Sharing-Data
//
//  Created by Mohammad Mugish on 21/12/18.
//  Copyright © 2018 Mohammad Mugish. All rights reserved.
//

import UIKit

class SelectDayVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    var user : User!
    
    var dayList :[String] = [String]()
    
    @IBOutlet weak var dayImageView: UIImageView!
    
    @IBOutlet weak var dayPicker: UIPickerView!
    
    @IBOutlet weak var nextBtn: BorderButtons!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        
        
        self.dayPicker.delegate = self
        self.dayPicker.dataSource = self
       
        setupParallax()
        dayList = ["","Monday", "Tuesday","Wednesday", "Thirsday","Friday","Saturday","Sunday", "All"]
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dayList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dayList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: dayList[row] , attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return attributedString
    }
    
    
    func setupParallax(){
        let min = CGFloat(-30)
        let max = CGFloat(30)
        
        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max
        
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [xMotion,yMotion]
        dayImageView.addMotionEffect(motionEffectGroup)
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(dayList[row])
        user.day = dayList[row]
        
        nextBtn.isEnabled = true
    }
    

}
