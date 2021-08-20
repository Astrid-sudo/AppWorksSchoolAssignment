//
//  DataManager.swift
//  URLAssignment
//
//  Created by Astrid on 2021/8/20.
//

import Foundation

protocol DataManagerDelegate {
    func updateUI(with information:StationData)
    func failedWithError(error:Error)
}

struct DataManager {
    
    var delegate:DataManagerDelegate?
    
    func performRequest(to address:String){
        
        let url = URL(string:address)!
        var request = URLRequest(url: url)
        request.httpMethod = "Get"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) {
            
            (data , response, error) in
            
            if let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                
                if let safeData = data {
                    do{
                        let loadedData =  try JSONDecoder().decode(StationData.self, from: safeData)
                        delegate?.updateUI(with: loadedData)
                        
                    } catch {
                        
                        delegate?.failedWithError(error: error)
                    }
                } else {
                    
                    print("Error: \((error!.localizedDescription))")
                    return
                }
            }
       } .resume()
    }
}
