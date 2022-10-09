//
//  APIModel.swift
//  PruebasServer
//
//  Created by Sebastian Casillas on 09/10/22.
//

import SwiftUI
import Alamofire
import SwiftyJSON


class ExamenModel:ObservableObject{
    
    @Published var examenes = [Examen]()
    
    init(){
        loadExamenes()
    }
    
    func loadExamenes(){
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        examenes.removeAll()
        
        
        let URL = Global.SERVER_URL + "getExamenes"
        
        print(URL)
        
        
        AF.request(URL, method: .get, encoding: URLEncoding.default).responseData {
            data in
            
            let json = try! JSON(data: data.data!)
            //print(json)
            
            var auxExamenes: Examen
            for examen in json {
                auxExamenes = Examen(idExamen: examen.1["IdExamen"].intValue,
                            nombreExamen: examen.1["Nombre"].stringValue,
                             registerExamen: formatter.date(from: examen.1["Register"].stringValue)!,
                             isActiveExamen: examen.1["Is_active"].boolValue,
                                     siglasExamen: examen.1["Siglas"].stringValue)
                self.examenes.append(auxExamenes)
            }
            
        }
        
    }
    
}
