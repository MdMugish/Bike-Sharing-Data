//
//  selectMonthVC.swift
//  iOS-App-with-Bike-Sharing-Data
//
//  Created by Mohammad Mugish on 20/12/18.
//  Copyright © 2018 Mohammad Mugish. All rights reserved.
//

import UIKit

class selectMonthVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    

    var user : User!
    
    var monthList :[String] = [String]()
 
    @IBOutlet weak var monthImageView: UIImageView!
    
    @IBOutlet weak var monthPicker: UIPickerView!
    
    @IBOutlet weak var nextBtn: BorderButtons!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.monthPicker.delegate = self
        self.monthPicker.dataSource = self
        setupParallax()
        monthList = ["", "January", "February", "March", "April", "May", "June", "All"]
        
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return monthList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return monthList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: monthList[row] , attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
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
        monthImageView.addMotionEffect(motionEffectGroup)
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(monthList[row])
        user.month = monthList[row]
        
        nextBtn.isEnabled = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let selectDayVC = segue.destination as? SelectDayVC {
                selectDayVC.user = user
            }
    }
    
    
    @IBAction func nextBtnAction(_ sender: Any) {
        performSegue(withIdentifier: "monthToDay", sender: self)
    }
    
}
