//
//  ViewController.swift
//  iOS-App-with-Bike-Sharing-Data
//
//  Created by Mohammad Mugish on 19/12/18.
//  Copyright © 2018 Mohammad Mugish. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var welcomeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupParallax()
        
        
    }

    @IBAction func uniwndSegue(unwindSeg : UIStoryboardSegue) {
        
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
        welcomeImageView.addMotionEffect(motionEffectGroup)
        
        
    }

    
}

