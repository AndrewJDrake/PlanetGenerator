//
//  FractionDisplayViewController.swift
//  PlanetGenerator
//
//  Created by Niharika Soma on 4/22/21.
//

import UIKit

class FractionDisplayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
          
        UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "Image")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
