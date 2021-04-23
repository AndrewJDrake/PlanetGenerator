//
//  DetailLookup.swift
//  PlanetGenerator
//
//  Created by Michael Oliver on 4/23/21.
//

import Foundation

func sizeLookup(code: Int) -> String{
    var returnString: String = ""
    
    switch code {
    case 0:
        returnString = "0 - Negligible Gravity (Asteroid / Deep Space Station)"
        break
    case 1:
        returnString = "1 - 0.05 G (Triton)"
        break
    case 2:
        returnString = "2 - 0.15 G (Luna)"
        break
    case 3:
        returnString = "3 - 0.25 G (Mercury)"
        break
    case 4:
        returnString = "4 - 0.35 G"
        break
    case 5:
        returnString = "5 - 0.45 G (Mars)"
        break
    case 6:
        returnString = "6 - 0.7 G"
        break
    case 7:
        returnString = "7 - 0.9 G"
        break
    case 8:
        returnString = "8 - 1.0 G (Earth)"
        break
    case 9:
        returnString = "9 - 1.25 G"
        break
    case 10:
        returnString = "A - 1.4 G"
        break
    default:
        returnString = "Unknown Gravity Class"
        break
    }
    
    return returnString
}

func atmosphereLookup(code: Int) -> String{
    var returnString: String = ""
    
    switch code {
    case 0:
        returnString = "0 - No Atmosphere - 0.00 PSI"
        break;
    case 1:
        returnString = "1 - Trace Atmo - 0.001 to 0.09 PSI"
        break;
    case 2:
        returnString = "2 - Very Thin, Tainted - 0.1 to 0.42 PSI"
        break;
    case 3:
        returnString = "3 - Very Thin - 0.1 to 0.42 PSI"
        break;
    case 4:
        returnString = "4 - Thin, Tainted - 0.43 to 0.7 PSI"
        break;
    case 5:
        returnString = "5 - Thin - 0.43 to 0.7 PSI"
        break;
    case 6:
        returnString = "6 - Standard - 0.71 to 1.49 PSI"
        break;
    case 7:
        returnString = "7 - Standard, Tainted - 0.71 to 1.49 PSI"
        break;
    case 8:
        returnString = "8 - Dense - 1.5 to 2.49 PSI"
        break;
    case 9:
        returnString = "9 - Dense, Tainted - 1.5 to 2.49 PSI"
        break;
    case 10:
        returnString = "A - Exotic - Air Supply"
        break;
    case 11:
        returnString = "B - Corrosive - Vacc Suit"
        break;
    case 12:
        returnString = "C - Insidious - Vacc Suit"
        break;
    case 13:
        returnString = "D - Very Dense - 2.5+ PSI"
        break;
    case 14:
        returnString = "E - Low - <0.5 PSI - High Altitude Vaccuum"
        break;
    case 15:
        returnString = "F - Unusual - Variable Protections"
        break;
    default:
        returnString = "Unknown Atmo Code"
        break;
    }
    
    return returnString
}

func hydroLookup(code: Int) -> String{
    var returnString: String = ""
    
    switch code {
    case 0:
        returnString = "0 - 0 to 5% Cover - Desert"
        break
    case 1:
        returnString = "1 - 6 to 15% Cover - Dry"
        break
    case 2:
        returnString = "2 - 16 to 25% Cover - Small Sea"
        break
    case 3:
        returnString = "3 - 26 to 35% Cover - Small Oceans"
        break
    case 4:
        returnString = "4 - 36 to 45% Cover - Wet"
        break
    case 5:
        returnString = "5 - 46 to 55% Cover - Large Oceans"
        break
    case 6:
        returnString = "6 - 56 to 65% Cover - Large Ocean"
        break
    case 7:
        returnString = "7 - 66 to 75% Cover - Earth-Like"
        break
    case 8:
        returnString = "8 - 76 to 85% Cover - Water World"
        break
    case 9:
        returnString = "9 - 86 to 95% Cover - Only Islands"
        break
    case 10:
        returnString = "A - 96+% Cover - Almost Entirely Water"
        break
    default:
        returnString = "Unrecognized Water Code"
    }
    
    return returnString
}

func populationLookup(code: Int) -> String{
    var gimmie: String = ""
    
    switch code {
    case 0:
        gimmie = "0 - No Known Inhabitants"
        break;
    case 1:
        gimmie = "1 - Few"
        break;
    case 2:
        gimmie = "2 - Hundreds"
        break;
    case 3:
        gimmie = "3 - Thousands"
        break;
    case 4:
        gimmie = "4 - Tens of Thousands"
        break;
    case 5:
        gimmie = "5 - Hundreds of Thousands"
        break;
    case 6:
        gimmie = "6 - Millions"
        break;
    case 7:
        gimmie = "7 - Tens of Millions"
        break;
    case 8:
        gimmie = "8 - Hundreds of Millions"
        break;
    case 9:
        gimmie = "9 - Billions"
        break;
    case 10:
        gimmie = "A - Tens of Billions"
        break;
    case 11:
        gimmie = "B - Hundreds of Billions"
        break;
    case 12:
        gimmie = "C - Trillions"
        break;
    default:
        gimmie = "Unrecognized Pop Code"
    }
    
    return gimmie
}

func govLookup(code: Int) -> String{
    var gimmie: String = ""
    
    switch code {
    case 0:
        gimmie = "0 - No Formal Government"
        break
    case 1:
        gimmie = "1 - Company/Corporation"
        break
    case 2:
        gimmie = "2 - Participating Democracy"
        break
    case 3:
        gimmie = "3 - Self-Perpetuating Oligarchy"
        break
    case 4:
        gimmie = "4 - Representative Democracy"
        break
    case 5:
        gimmie = "5 - Feudal Technocracy"
        break
    case 6:
        gimmie = "6 - Captive Government"
        break
    case 7:
        gimmie = "7 - Balkanisation"
        break
    case 8:
        gimmie = "8 - Civil Service Bureaucracy"
        break
    case 9:
        gimmie = "9 - Impersonal Bureaucracy"
        break
    case 10:
        gimmie = "A - Charismatic Dictator"
        break
    case 11:
        gimmie = "B - Non-Charismatic Leader"
        break
    case 12:
        gimmie = "C - Charismatic Oligarchy"
        break
    case 13:
        gimmie = "D - Religious Dictatorship"
        break
    case 14:
        gimmie = "E - Religious Autocracy"
        break
    case 15:
        gimmie = "F - Totalitarian Oligarchy"
        break
    default:
        gimmie = "Unrecognized Gov Code"
    }
    
    return gimmie
}
