//
//  FractionDisplayViewController.swift
//  PlanetGenerator
//
//  Created by Niharika Soma on 4/22/21.
//

import UIKit

class FractionDisplayViewController: UIViewController {

    var faction: (class:Int, strength:String, diff:String, name:String)!
    
    @IBOutlet weak var SystemLabel: UILabel!
    @IBOutlet weak var QuirkLabel: UILabel!
    @IBOutlet weak var GovLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          
        UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "Image")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SystemLabel.text = "System of Gov:" + govLookup(code:faction.class)
        if (faction.diff != ""){
        QuirkLabel.text = "Cultural Quirk:" + faction.diff
        }
        else{
            QuirkLabel.text = ""
        }
        if (faction.strength != ""){
            GovLabel.text = "Relative Power:" + faction.strength
        }
        else{
            GovLabel.text = ""
        }
    }

    @IBAction func GoBack(_ sender: Any) {
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
