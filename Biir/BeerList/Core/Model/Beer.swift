//
//  Beer.swift
//  Biir
//
//  Created by Frank on 03/03/2021.
//

import Foundation
import SwiftUI

struct Beer: Equatable {
    var id: String
    var name: String
    var alcohol: String?
    var bitterness: String?
    var description: String?
    var category: String?
    var iconUrl: String?
    var largeIconUrl: String?
    var icon: UIImage?
    var largeIcon: UIImage?
}
