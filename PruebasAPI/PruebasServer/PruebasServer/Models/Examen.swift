//
//  Examen.swift
//  PruebasServer
//
//  Created by Sebastian Casillas on 09/10/22.
//

import SwiftUI

struct Examen: Identifiable{
    var id = UUID()
    var idExamen: Int
    var nombreExamen: String
    var registerExamen: Date
    var isActiveExamen: Bool
    var siglasExamen: String
}
