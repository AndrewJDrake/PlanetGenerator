//
//  Oliver_Functions.swift
//  PlanetGenerator
//
//  Created by Michael Oliver on 4/21/21.
//

import Foundation
import UIKit

//Data Structure for PlanetCode.
struct PlanetCode {
    var size: Int = 0
    var atmo: Int = 0
    var hydr: Int = 0
    var temp: Int = 0
    var popu: Int = 0
    var mGov: (class:Int, strength:String, diff:String, name:String) = (class:0, strength: "", diff: "", name: "")
    var fact: [(class:Int, strength:String, diff:String, name:String)] = []
    var lawL: Int = 0
    var star: Character = "X"
    var navy: Bool = false
    var scou: Bool = false
    var reas: Bool = false
    var TASh: Bool = false
    var tech: Int = 0
    var TrCo: [String] = []
}

// Function rolls a number of D6 Specified by the argument "dice" and returns the
// Integer value of the result.
func rollD6(dice:Int) -> Int{
    var value: Int = 0
    for _ in 0..<dice {
        value = value + Int.random(in:1...6)
    }
    return value
}

// Function rolls a D66, which is two D6 with the first being multiplied by ten.
func rollD66() -> Int{
    return (10 * Int.random(in: 1...6) + Int.random(in: 1...6))
}

// This is a lookup table for cultural differences.
// We do not provide explainations beyond the term, because the user is expected to
// use this as a "Story Seed" instead of a prescription.
func differenceLookup(selection: Int) -> String{
    var returnString = ""
    switch selection {
    case 11: return "Sexist"
    case 12: return "Religious"
    case 13: return "Artistic"
    case 14: return "Ritualised"
    case 15: return "Conservative"
    case 16: return "Xenophobic"
    case 21: return "Taboo"
    case 22: return "Deceptive"
    case 23: return "Liberal"
    case 24: return "Honourable"
    case 25: return "Influenced"
    case 26: // Fusion of Two
        returnString += differenceLookup(selection: rollD66())
        returnString += " and "
        returnString += differenceLookup(selection: rollD66())
        return returnString
    case 31: return "Barbaric"
    case 32: return "Remnant"
    case 33: return "Degenerate"
    case 34: return "Progressive"
    case 35: return "Recovering"
    case 36: return "Nexus"
    case 41: return "Tourist Attraction"
    case 42: return "Violent"
    case 43: return "Peaceful"
    case 44: return "Obsessed"
    case 45: return "Fashion"
    case 46: return "At War"
    case 51: return "Unusual Custom: Offworlders"
    case 52: return "Unusual Custom: Starport"
    case 53: return "Unusual Customs: Technology"
    case 54: return "Unusual Customs: Lifecycle"
    case 55: return "Unusual Customs: Media"
    case 56: return "Unusual Customs: Social Standings"
    case 61: return "Unusual Customs: Trade"
    case 62: return "Unusual Customs: Nobility"
    case 63: return "Unusual Customs: Sex"
    case 64: return "Unusual Customs: Eating"
    case 65: return "Unusual Customs: Travel"
    case 66: return "Unusual Custom: Conspiracy"
    default: return "None"
    }
}

// Lookup Table for Relative Faction Strength
func factionStrengthGen(DiceRoll:Int) -> String{
    var FacStr: String = ""
    
    if DiceRoll <= 3{
        FacStr = "Obscure Group"
    }
    else if DiceRoll <= 5{
        FacStr = "Fringe Group"
    }
    else if DiceRoll <= 7{
        FacStr = "Minor Group"
    }
    else if DiceRoll <= 9{
        FacStr = "Notable Group"
    }
    else if DiceRoll <= 11{
        FacStr = "Significant"
    }
    else if DiceRoll >= 12{
        FacStr = "Overwhelming Popular Support"
    }
    
    return FacStr
}

// Function to generate new Faction.
func FactionGenerate(Modifier: Int, MainFac:Bool) -> (class:Int, strength:String, diff:String, name:String){
    var returnObject: (class:Int, strength:String, diff:String, name:String) = (0,"","","")
    
    returnObject.name = "Please Enter a Name"
    returnObject.class = rollD6(dice: 2) - 7 + Modifier
    if returnObject.class < 0{
        returnObject.class = 0
    }
    else if returnObject.class > 15{
        returnObject.class = 15
    }
    returnObject.diff = differenceLookup(selection: rollD66())
    
    if MainFac == false {
        returnObject.strength = factionStrengthGen(DiceRoll: rollD6(dice: 2))
    }
    
    return returnObject
}

// Function generates a PlanetCode Structure.
// This is effectively a reusable initializer for the structure.
func generatePlanet() -> PlanetCode{
    var planet: PlanetCode! = PlanetCode()
    
    // Generate Planet Size, and then normalize the value if it went out of range.
    planet.size = (rollD6(dice: 2) - 2)
    if planet.size < 0 {
        planet.size = 0
    }
    else if planet.size > 10{
        planet.size = 10
    }
    
    // Generate Planet Atmosphere, and then normalize the value if it went out of range.
    planet.atmo = (rollD6(dice: 2) - 7 + planet.size)
    if planet.atmo < 0 {
        planet.atmo = 0
    }
    else if planet.atmo >= 15{
        planet.atmo = 15
    }
    
    // Generate Planet Temperature.
    planet.temp = (rollD6(dice: 2))
    // See if any modifiers from atmosphere apply.
    switch planet.atmo {
    case 2:
        planet.temp -= 2
        break
    case 3:
        planet.temp -= 2
        break
    case 4:
        planet.temp -= 1
        break
    case 5:
        planet.temp -= 1
        break
    case 8:
        planet.temp += 1
        break
    case 9:
        planet.temp += 1
        break
    case 10:
        planet.temp += 2
        break
    case 11:
        planet.temp += 6
        break
    case 12:
        planet.temp += 6
        break
    case 13:
        planet.temp += 2
        break
    case 14:
        planet.temp -= 1
        break
    case 15:
        planet.temp += 2
        break
    default:
        break
    }
    // Normalize Temperature.
    if planet.temp < 0 {
        planet.temp = 0
    }
    else if planet.temp > 12 {
        planet.temp = 12
    }
    
    // Calculate planet Hydrography, checking for situational modifiers.
    if planet.size == 0 || planet.size == 1{
        planet.hydr = 0
    }
    else if (planet.atmo >= 0 && planet.atmo <= 1) || (planet.atmo >= 10 && planet.temp <= 12) {
        planet.hydr = (rollD6(dice: 2) - 7 - 4 + planet.atmo)
    }
    else{
        planet.hydr = (rollD6(dice: 2) - 7 + planet.atmo)
    }
    // Apply Modifiers based on planet Temperature.
    if (10 <= planet.temp && planet.temp <= 11){
        planet.hydr -= 2
    }
    else if planet.temp >= 12{
        planet.hydr -= 6
    }
    // Normalize.
    if planet.hydr < 0{
        planet.hydr = 0
    }
    else if planet.hydr > 10{
        planet.hydr = 10
    }
    
    // Generate Planet Population.
    planet.popu = rollD6(dice: 2) - 2
    if planet.popu < 0{
        planet.popu = 0
    }
    else if planet.popu > 12{
        planet.popu = 12
    }
    
    // Generate Planet's Main Faction
    // TODO: Replace this with a call to GenerateFaction() once that function works.
    planet.mGov = FactionGenerate(Modifier: planet.popu, MainFac: true)
    
    
    // Generate Lesser Factions
    var minorFactions: Int = 0;
    if planet.mGov.class == 0{
        minorFactions = Int.random(in: 1...4)
    }
    else if planet.mGov.class >= 10{
        minorFactions = Int.random(in: 1...2)
    }
    else{
        minorFactions = Int.random(in: 1...3)
    }
    var faction: (class:Int, strength:String, diff:String, name:String)
    for _ in 1...minorFactions{
        faction = FactionGenerate(Modifier: planet.popu, MainFac: false)
        planet.fact += [faction]
    }
    
    // Setup the Planetary Law Level, based on Government.
    planet.lawL = rollD6(dice: 2) - 7 + planet.mGov.class
    if planet.lawL < 0{
        planet.lawL = 0
    }
    if planet.lawL > 9{
        planet.lawL = 9
    }
    
    // Calculate Starport Class, after finding population modifier.
    var popuMod: Int = 0
    if planet.popu >= 10{
        popuMod = 2
    }
    else if planet.popu >= 8{
        popuMod = 2
    }
    else if planet.popu <= 2{
        popuMod = -2
    }
    else if planet.popu <= 4{
        popuMod = -1
    }
    let starportIntermediary = rollD6(dice: 2) + popuMod
    
    // Look up what that dice roll actually means.
    if starportIntermediary <= 2{
        planet.star = "X"
    }
    else if starportIntermediary <= 4{
        planet.star = "E"
    }
    else if starportIntermediary <= 6{
        planet.star = "D"
    }
    else if starportIntermediary <= 8{
        planet.star = "C"
    }
    else if starportIntermediary <= 10{
        planet.star = "B"
    }
    else if starportIntermediary >= 11{
        planet.star = "A"
    }
    
    // Generate pressence of Navy, Scout, and Research Bases (or TAS Hostels).
    if planet.star == "A"{
        planet.TASh = true
        if rollD6(dice: 2) > 8{
            planet.navy = true
        }
        if rollD6(dice: 2) > 10{
            planet.scou = true
        }
        if rollD6(dice: 2) > 8{
            planet.reas = true
        }
    }
    else if planet.star == "B"{
        planet.TASh = true
        if rollD6(dice: 2) > 8{
            planet.navy = true
        }
        if rollD6(dice: 2) > 8{
            planet.scou = true
        }
        if rollD6(dice: 2) > 10{
            planet.reas = true
        }
    }
    else if planet.star == "C"{
        if rollD6(dice: 2) > 10{
            planet.TASh = true
        }
        if rollD6(dice: 2) > 8{
            planet.navy = true
        }
        if rollD6(dice: 2) > 8{
            planet.scou = true
        }
    }
    else if planet.star == "D"{
        if rollD6(dice: 2) > 7{
            planet.scou = true
        }
    }
    
    // Generate modifiers for Tech Level based on planetary features.
    var techMod: Int = 0
    if planet.star == "A"{
        techMod += 6
    }
    else if planet.star == "B"{
        techMod += 4
    }
    else if planet.star == "C"{
        techMod += 2
    }
    else if planet.star == "X"{
        techMod -= 4
    }
    if planet.size == 0 || planet.size == 1{
        techMod += 2
    }
    else if planet.size >= 2 && planet.size <= 4{
        techMod += 1
    }
    if (0 <= planet.atmo && planet.atmo <= 3) || (10 <= planet.atmo && planet.atmo <= 15){
        techMod += 1
    }
    if planet.hydr == 0 || planet.hydr == 9{
        techMod += 1
    }
    else if planet.hydr == 10{
        techMod += 2
    }
    if planet.popu >= 1 && planet.popu <= 5 || planet.popu == 8{
        techMod += 1
    }
    else if planet.popu == 9{
        techMod += 2
    }
    else if planet.popu == 10{
        techMod += 4
    }
    if planet.mGov.class == 0 || planet.mGov.class == 5{
        techMod += 1
    }
    else if planet.mGov.class == 7{
        techMod += 1
    }
    else if planet.mGov.class == 13 || planet.mGov.class == 14{
        techMod -= 2
    }
    // Generate tech level and prevent negatives from existing. There's nothing lower than 0
    // when 0 represents "Pre-Neolithic Society" (They haven't even figured out how to use a stick).
    planet.tech = rollD6(dice: 1) + techMod
    if planet.tech < 0{
        planet.tech = 0
    }
    // Override tech to accomodate for atmospheric/survival minimums.
    if planet.tech < 3 && (planet.atmo == 4 || planet.atmo == 7 || planet.atmo == 9){
        planet.tech = 3
    }
    else if planet.tech < 5 && (planet.atmo == 2 || planet.atmo == 3 || planet.atmo == 13 || planet.atmo == 14){
        planet.tech = 5
    }
    else if planet.tech < 8 && (planet.atmo == 0 || planet.atmo == 1 || planet.atmo == 10 || planet.atmo == 15){
        planet.tech = 8
    }
    else if planet.tech < 9 && planet.atmo == 11{
        planet.tech = 9
    }
    else if planet.tech < 10 && planet.atmo == 12{
        planet.tech = 10
    }
    
    // Assign Trade Codes. This is a complicated process of looking up some intricate conditional
    // Statements.
    // Ignore the odd formatting on the first one, that happened as part of an attempt to fix a
    // bug that is no longer present.
    if (planet.atmo >= 4 && planet.atmo <= 9) {
        if (planet.hydr >= 4 && planet.hydr <= 8){
            if (planet.popu >= 5 && planet.popu <= 7){
                planet.TrCo += ["Ag"]
            }
        }
    }
    if planet.size == 0 && planet.atmo == 0 && planet.hydr == 0{
        planet.TrCo += ["As"]
    }
    if planet.popu == 0 && planet.mGov.class == 0 && planet.lawL == 0{
        planet.TrCo += ["Ba"]
    }
    if planet.atmo >= 2 && planet.hydr == 0{
        planet.TrCo += ["De"]
    }
    if planet.atmo >= 10 && planet.hydr >= 1{
        planet.TrCo += ["Fl"]
    }
    if planet.size >= 6 && planet.size <= 8 && (planet.atmo == 5 || planet.atmo == 6 || planet.atmo == 8) && planet.popu >= 5 && planet.popu <= 7{
        planet.TrCo += ["Ga"]
    }
    if planet.popu >= 9{
        planet.TrCo += ["Hi"]
    }
    if planet.tech >= 12{
        planet.TrCo += ["Ht"]
    }
    if planet.atmo >= 0 && planet.atmo <= 1 && planet.hydr >= 1{
        planet.TrCo += ["Ic"]
    }
    if ((planet.atmo >= 0 && planet.atmo <= 2) || planet.atmo == 4 || planet.atmo == 7 || planet.atmo == 9) && planet.popu >= 9{
        planet.TrCo += ["In"]
    }
    if planet.popu <= 3{
        planet.TrCo += ["Lo"]
    }
    if planet.popu <= 5{
        planet.TrCo += ["Lt"]
    }
    if planet.atmo >= 0 && planet.atmo <= 3 && planet.hydr >= 0 && planet.hydr <= 3 && planet.popu >= 6{
        planet.TrCo += ["Na"]
    }
    if planet.popu >= 0 && planet.popu <= 6{
        planet.TrCo += ["Ni"]
    }
    if planet.atmo >= 2 && planet.atmo <= 3 && planet.hydr >= 0 && planet.hydr <= 3{
        planet.TrCo += ["Po"]
    }
    if (planet.atmo == 6 || planet.atmo == 8) && planet.popu >= 6 && planet.popu <= 8 && planet.mGov.class >= 4 && planet.mGov.class <= 9{
        planet.TrCo += ["Ri"]
    }
    if planet.atmo == 0{
        planet.TrCo += ["Va"]
    }
    if planet.hydr >= 10{
        planet.TrCo += ["Wa"]
    }
    
    return planet
}

