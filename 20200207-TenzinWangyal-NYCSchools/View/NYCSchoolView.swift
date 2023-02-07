//
//  ContentView.swift
//  20200207-TenzinWangyal-NYCSchools
//
//  Created by Tenzin wangyal on 2/7/23.
//

import SwiftUI

struct NYCSchoolView: View {
    @ObservedObject var vm = ViewModel()
    var body: some View {
        VStack {
            List(vm.schools,id: \.school_name){ school in
                
                DisclosureGroup(school.school_name) {
                    VStack{
                        
                        NewText(schoolInfo: "School DBN - \(school.dbn)", color: .brown)
                        NewText(schoolInfo: "Number of SAT Takers - \(school.num_of_sat_test_takers)", color: .mint)
                        
                        HStack{
                            NewText(schoolInfo: "Writing \(school.sat_writing_avg_score)", color: .blue)
                            
                            NewText(schoolInfo: "Math \(school.sat_math_avg_score)", color: .red)
                            NewText(schoolInfo: "Reading \(school.sat_critical_reading_avg_score)", color: .yellow)
                        }
                    }
                }
            }
            .onAppear(perform: vm.loadSchool)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NYCSchoolView()
    }
}


