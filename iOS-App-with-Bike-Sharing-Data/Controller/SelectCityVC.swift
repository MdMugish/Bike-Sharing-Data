

import UIKit

class SelectCityVC: UIViewController {

    var user : User!
    
    
    @IBOutlet weak var cityImage: UIImageView!
    
    @IBOutlet weak var nextBtn: BorderButtons!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        user = User()
        setupParallax()
    }
    
    @IBAction func newYorkBtn(_ sender: Any) {
        actionAfterTouchCity(City: "NEW YORK")
    }
    
    @IBAction func chicagoBtn(_ sender: Any) {
        actionAfterTouchCity(City: "CHICAGO")
    }
    
    @IBAction func washingtonBtn(_ sender: Any) {
       actionAfterTouchCity(City: "WASHINGTON")
        
    }
    
    
    @IBAction func nextBtn(_ sender: Any) {
        performSegue(withIdentifier: "nextAfterCity", sender: self)
    }
    
    func actionAfterTouchCity(City:String){
        user.city = City
        nextBtn.isEnabled = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectMonthVC = segue.destination as? selectMonthVC {
            selectMonthVC.user = user
        }
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
        cityImage.addMotionEffect(motionEffectGroup)
        
        
    }

}
