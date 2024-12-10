//
//  EmployeeList.swift
//  SwiftUICombine
//
//  Created by Harshit Rastogi on 10/12/24.
//

import SwiftUI

struct EmployeeList: View {
    let onLongPress: () -> Void
    
    var body: some View {
        List(0...5, id: \.self){_ in
            EmployeeCell(onLongPress: onLongPress)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)
                .padding()
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
        }
        .listStyle(.plain)
        .padding(.horizontal)
    }
}
