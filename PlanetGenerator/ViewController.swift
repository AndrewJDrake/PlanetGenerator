//
//  ViewController.swift
//  PlanetGenerator
//
//  Created by Michael Oliver on 4/21/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        


        func viewWillLayoutSubviews() {
            self.navigationController?.isNavigationBarHidden = true
        }
        
        
        imageview.layer.cornerRadius = imageview.layer.bounds.height / 2
        imageview.clipsToBounds = true
        
        UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "Image")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        
      
        // Do any additional setup after loading the view.
    }


}

