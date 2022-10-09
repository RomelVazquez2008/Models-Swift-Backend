//
//  PreguntasPorExamen.swift
//  PruebasServer
//
//  Created by Sebastian Casillas on 09/10/22.
//

import SwiftUI

struct PreguntasPorExamen: Identifiable{
    var id = UUID()
    var nombreExamen: String
    var siglasExamen: String
    var idPregunta: [Int]
    var nombrePregunta: [String]
}
