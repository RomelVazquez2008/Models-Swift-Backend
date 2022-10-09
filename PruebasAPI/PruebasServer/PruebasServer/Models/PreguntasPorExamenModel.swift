//
//  PreguntasPorExamenModel.swift
//  PruebasServer
//
//  Created by Sebastian Casillas on 09/10/22.
//

import SwiftUI
import Alamofire
import SwiftyJSON


class PreguntasPorExamenModel:ObservableObject{
    
    @Published var preguntasPorExamen = [PreguntasPorExamen]()
    
    func loadPreguntasPorExamen(id: Int){
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        preguntasPorExamen.removeAll()
        
        
        let URL = Global.SERVER_URL + "getPreguntasPorExamen/\(id)"
        
        
        AF.request(URL, method: .get, encoding: URLEncoding.default).responseData {
            data in
            
            let json = try! JSON(data: data.data!)
            //print(json)
            
            var auxPreguntasPorExamen: PreguntasPorExamen
            for preguntasPorExamen in json {
                
                var idPreguntaInt = [Int]()
                var preguntaString = [String]()
                
                for pregunta in preguntasPorExamen.1["Pregunta"] {
                    idPreguntaInt.append(pregunta.1["IdPregunta"].intValue)
                    preguntaString.append(pregunta.1["Pregunta"].stringValue)
                }
                
                
                
                
                auxPreguntasPorExamen = PreguntasPorExamen(nombreExamen: preguntasPorExamen.1["Nombre"].stringValue,
                    siglasExamen: preguntasPorExamen.1["Nombre"].stringValue,
                    idPregunta: idPreguntaInt,
                    nombrePregunta: preguntaString)
                self.preguntasPorExamen.append(auxPreguntasPorExamen)
            }
            
        }
    }
    
}
