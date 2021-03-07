//
//  bitternessCalc.swift
//  Biir
//
//  Created by Frank on 04/03/2021.
//

import Foundation

func calculateIBU (_ ibuString: String?) -> String? {
    guard let ibuString = ibuString else { return nil }
    guard let ibu = Int(ibuString) else { return nil }
    
    if ibu <= 20 {
        return "Smooth"
    } else if ibu <= 50 {
        return "Bitter"
    } else {
        return "Hipster Plus"
    }
}
