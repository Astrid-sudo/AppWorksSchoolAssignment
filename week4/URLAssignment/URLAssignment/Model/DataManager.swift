//
//  DataManager.swift
//  URLAssignment
//
//  Created by Astrid on 2021/8/20.
//

import Foundation

protocol DataManagerDelegate {
  
  func updateUI(with information: StationData)
  
  func failedWithError(error:Error)
  
}

struct DataManager {
  
  var delegate:DataManagerDelegate?
  
  func performRequest(to address: String){
    
    guard let url = URL(string: address) else { return }
    
    var request = URLRequest(url: url)
    
    request.httpMethod = "Get"
    
    let session = URLSession(configuration: .default)
    
    session.dataTask(with: url) {
      (data , response, error) in
      if let error = error {
        delegate?.failedWithError(error: error)
        return
      }
      
      if let safeData = data {
        do {
          let loadedData = try JSONDecoder().decode(StationData.self, from: safeData)
          delegate?.updateUI(with: loadedData)
        } catch {
          delegate?.failedWithError(error: error)
        }
      }
    } .resume()
  }
  
}
