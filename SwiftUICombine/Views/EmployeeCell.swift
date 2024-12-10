//
//  EmployeeCell.swift
//  SwiftUICombine
//
//  Created by Harshit Rastogi on 10/12/24.
//

import SwiftUI

struct EmployeeCell: View {
    let onLongPress: () -> Void
    
    var body: some View {
        HStack {
            GeometryReader { geometry in
                AsyncImage(url: URL(string: "")) { image in
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
                Text("Name: ")
                    .font(.headline)
                Text("Age: ")
                    .font(.subheadline)
                Text("Salary: $")
                    .font(.subheadline)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .onTapGesture {
            
        }
        .onLongPressGesture {
            onLongPress()
        }
    }
}
