//
//  Network.swift
//  20200207-TenzinWangyal-NYCSchools
//
//  Created by Tenzin wangyal on 2/7/23.
//

import Foundation
class ViewModel: ObservableObject{
    @Published var schools: [SchoolData] = []
    
    func loadSchool(){
        let urlString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
        guard let url = URL(string: urlString) else{return}
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data{
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode([SchoolData].self, from: data){
                    DispatchQueue.main.async {
                        self.schools = decodedData
                    }
                }
            }
        }
        dataTask.resume()
    }
}
