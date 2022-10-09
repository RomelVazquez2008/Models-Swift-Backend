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
    
    
    init(){
        preguntasPorExamenModel.loadPreguntasPorExamen(id: 1)
        print(preguntasPorExamenModel.preguntasPorExamen[0].nombreExamen)
        print(preguntasPorExamenModel.preguntasPorExamen[0].siglasExamen)
    }
    
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
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
