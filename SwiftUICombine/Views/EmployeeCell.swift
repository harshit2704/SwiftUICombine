//
//  EmployeeCell.swift
//  SwiftUICombine
//
//  Created by Harshit Rastogi on 10/12/24.
//

import SwiftUI

struct EmployeeCell: View {
    let onLongPress: (Employee) -> Void
    let employee: Employee
    
    var body: some View {
        HStack {
            GeometryReader { geometry in
                AsyncImage(url: URL(string: employee.profile_image ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {}
                .frame(width: geometry.size.height, height: geometry.size.height)
                .clipShape(Circle())
                .padding(.leading)
            }
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text("Name: \(employee.employee_name ?? "")")
                    .font(.headline)
                Text("Age: \(employee.employee_age ?? 00)")
                    .font(.subheadline)
                Text("Salary: $\(employee.employee_salary ?? 00)")
                    .font(.subheadline)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .onTapGesture {
            
        }
        .onLongPressGesture {
            onLongPress(employee)
        }
    }
}
