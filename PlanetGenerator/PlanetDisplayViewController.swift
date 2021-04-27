//
//  PlanetDisplayViewController.swift
//  PlanetGenerator
//
//  Created by Niharika Soma on 4/22/21.
//

import UIKit

class PlanetDisplayViewController: UIViewController {

    let delegate = UIApplication.shared.delegate as! AppDelegate
    var selectedFaction: (class:Int, strength:String, diff:String, name:String)!
    
    var buildAString: String = ""
    
    @IBOutlet weak var PlanetCode: UILabel!
    @IBOutlet weak var SizeCode: UILabel!
    @IBOutlet weak var AtmoCode: UILabel!
    @IBOutlet weak var HydroCode: UILabel!
    @IBOutlet weak var Population: UILabel!
    @IBOutlet weak var GovCode: UILabel!
    @IBOutlet weak var LawCode: UILabel!
    @IBOutlet weak var TechCode: UILabel!
    @IBOutlet weak var PlanetGeneratorButton: UIButton!
    @IBOutlet weak var CultureQuirk: UILabel!
    @IBOutlet weak var TradeCodes: UILabel!
    @IBOutlet weak var StarportGrade: UILabel!
    @IBOutlet weak var Fac1Button: UIButton!
    @IBOutlet weak var Fac2Button: UIButton!
    @IBOutlet weak var Fac3Button: UIButton!
    @IBOutlet weak var Fac4Button: UIButton!
    @IBOutlet weak var GovButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlanetGeneratorButton.layer.cornerRadius = 9
        PlanetGeneratorButton.layer.borderWidth = 1
        UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "Image")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        PlanetCode.text = "World Profile: "
        TechCode.text = "Tech Level: "
        AtmoCode.text = "Atmo: "
        HydroCode.text = "Hydro: "
        Population.text = "Pop: "
        GovCode.text = "Gov: "
        CultureQuirk.text = "Culture Quirk: "
        LawCode.text = "Law: "
        TechCode.text = "Tech: "
        StarportGrade.text = "Starport: "
        GovButton.isHidden = true
        Fac1Button.isHidden = true
        Fac2Button.isHidden = true
        Fac3Button.isHidden = true
        Fac4Button.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ButtonPressAction(_ sender: Any) {
        delegate.DisplayPlanet = generatePlanet()
        PlanetCode.text = "World Profile: " + buildTrace(planet:delegate.DisplayPlanet)
        SizeCode.text = "Size: " + sizeLookup(code: delegate.DisplayPlanet.size)
        AtmoCode.text = "Atmo: " + atmosphereLookup(code: delegate.DisplayPlanet.atmo)
        HydroCode.text = "Hydro: " + hydroLookup(code: delegate.DisplayPlanet.hydr)
        Population.text = "Population: " + populationLookup(code: delegate.DisplayPlanet.popu)
        GovCode.text = "Gov. Type: " + govLookup(code: delegate.DisplayPlanet.mGov.class)
        CultureQuirk.text = "Culture Quirk: " + delegate.DisplayPlanet.mGov.diff
        LawCode.text = "Law Level: " + String(delegate.DisplayPlanet.lawL)
        TechCode.text = "Tech Level: " + String(delegate.DisplayPlanet.tech)
        buildAString = "Trade Code: "
        if (delegate.DisplayPlanet.TrCo.count-1 > 0){
            for i in 0...(delegate.DisplayPlanet.TrCo.count-1){
                buildAString += delegate.DisplayPlanet.TrCo[i] + " "
            }
        }
        TradeCodes.text = buildAString
        StarportGrade.text = "Starport: " + String(delegate.DisplayPlanet.star)
        GovButton.isHidden = false
        if (delegate.DisplayPlanet.fact.count >= 1){
            Fac1Button.isHidden = false
        }
        else{
            Fac1Button.isHidden = true
        }
        if (delegate.DisplayPlanet.fact.count >= 2){
            Fac2Button.isHidden = false
        }
        else{
            Fac2Button.isHidden = true
        }
        if (delegate.DisplayPlanet.fact.count >= 3){
            Fac3Button.isHidden = false
        }
        else{
            Fac3Button.isHidden = true
        }
        if (delegate.DisplayPlanet.fact.count >= 4){
            Fac4Button.isHidden = false
        }
        else{
            Fac4Button.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowFaction"){
            let FactionViewContainer = segue.destination as! FractionDisplayViewController
            FactionViewContainer.faction = selectedFaction
        }
    }
    
    @IBAction func PlanetGovButton(_ sender: Any) {
        selectedFaction = delegate.DisplayPlanet.mGov
        performSegue(withIdentifier: "ShowFaction", sender: nil)
    }
    @IBAction func FactionButton1(_ sender: Any) {
        selectedFaction = delegate.DisplayPlanet.fact[0]
        performSegue(withIdentifier: "ShowFaction", sender: nil)
    }
    @IBAction func FactionButton2(_ sender: Any) {
        selectedFaction = delegate.DisplayPlanet.fact[1]
        performSegue(withIdentifier: "ShowFaction", sender: nil)
    }
    @IBAction func FactionButton3(_ sender: Any) {
        selectedFaction = delegate.DisplayPlanet.fact[2]
        performSegue(withIdentifier: "ShowFaction", sender: nil)
    }
    @IBAction func FactionButton4(_ sender: Any) {
        selectedFaction = delegate.DisplayPlanet.fact[3]
        performSegue(withIdentifier: "ShowFaction", sender: nil)
    }
    
    @IBAction func unwinder(unwindSegue: UIStoryboardSegue){
        
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
