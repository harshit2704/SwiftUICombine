//
//  EmployeeList.swift
//  SwiftUICombine
//
//  Created by Harshit Rastogi on 10/12/24.
//

import SwiftUI

struct EmployeeList: View {
    @ObservedObject var viewModel: EmployeeViewModel
    let onLongPress: (Employee) -> Void
    
    var body: some View {
        List(viewModel.employees){ employee in
            EmployeeCell(onLongPress: onLongPress, employee: employee)
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
