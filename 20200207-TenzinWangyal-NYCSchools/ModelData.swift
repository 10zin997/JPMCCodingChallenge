//
//  ModelData.swift
//  20200207-TenzinWangyal-NYCSchools
//
//  Created by Tenzin wangyal on 2/7/23.
//

import Foundation
struct SchoolData: Codable{
    let dbn: String
    let school_name: String
    let num_of_sat_test_takers: String
    let sat_critical_reading_avg_score: String
    let sat_math_avg_score: String
    let sat_writing_avg_score: String
    
}
