//
//  Network.swift
//  20200207-TenzinWangyal-NYCSchools
//
//  Created by Tenzin wangyal on 2/7/23.
//

import Foundation
class ViewModel: ObservableObject{
    
    // Property that holds the array of school data, which is published so it can be observed and trigger updates in the view
    @Published var schools: [SchoolData] = []
    
    // Function that loads the list of schools from an API
    func loadSchool(){
        let urlString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
        
        // Create a URL object from the API endpoint
        guard let url = URL(string: urlString) else{return}
        
        // Create a data task to fetch the data from the API
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Check if the data was successfully fetched
            if let data = data{
                
                // Create a JSON decoder
                let decoder = JSONDecoder()
                
                // Attempt to decode the data into an array of SchoolData objects
                if let decodedData = try? decoder.decode([SchoolData].self, from: data){
                    
                    // Update the schools property on the main thread
                    DispatchQueue.main.async {
                        self.schools = decodedData
                    }
                }
            }
        }
        dataTask.resume()
    }
}
