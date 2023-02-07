//
//  NewText.swift
//  20200207-TenzinWangyal-NYCSchools
//
//  Created by Tenzin wangyal on 2/7/23.
//

import SwiftUI

struct NewText: View{
    var schoolInfo: String
    var color: Color
    var body: some View{
        Text(schoolInfo)
            .font(.callout)
            .bold()
            .fontDesign(.rounded)
            .padding()
            .background(color)
    }
}
