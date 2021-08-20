//
//  ViewController.swift
//  URLAssignment
//
//  Created by Astrid on 2021/8/19.
//

import UIKit

class ViewController: UIViewController {
    
    //Practice autolayout code
    //Make it MVC
    
    
    @IBOutlet weak var stationIDLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData(){
        let url = URL(string: "https://stations-98a59.firebaseio.com/practice.json")!
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
                        
                        DispatchQueue.main.async {
                            self.stationIDLabel.text = loadedData.stationID
                            self.stationNameLabel.text = loadedData.stationName
                            self.addressLabel.text = loadedData.stationAddress
                        }
                        
                    } catch {
                        
                        print("Parse JSON Failed: \(error.localizedDescription)")
                   }
                } else {
                    
                    print("Error: \((error!.localizedDescription))")
                    return
                }
           }
            
        } .resume()
    }
}
