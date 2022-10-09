//
//  ContentView.swift
//  PruebasServer
//
//  Created by Sebastian Casillas on 09/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var examenModel = ExamenModel()
    
    @StateObject var preguntasPorExamenModel =  PreguntasPorExamenModel()
    
    
    
    
    var body: some View {
        VStack{
            Text("Prueba1")
            List {
                ForEach(examenModel.examenes) { examen in
                    Text(examen.nombreExamen)
                    Text(examen.siglasExamen)
                }
            }
            Text("Prueba2")
            getPreguntasPorExamen(id: 1)
            List{
                ForEach(preguntasPorExamenModel.preguntasPorExamen) {
                    preguntasPorExamen in
                    Text(preguntasPorExamen.nombreExamen)
                    Text(preguntasPorExamen.siglasExamen)
//                    Text(preguntasPorExamen.idPregunta)
//                    Text(preguntasPorExamen.nombrePregunta)
                }
            }
        }
        
    }
    
    func getPreguntasPorExamen(id: Int){
        preguntasPorExamenModel.loadPreguntasPorExamen(id: id)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
