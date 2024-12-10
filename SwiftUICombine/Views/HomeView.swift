//
//  HomeView.swift
//  SwiftUICombine
//
//  Created by Harshit Rastogi on 10/12/24.
//

import SwiftUI

struct HomeView: View {
    @State private var showDialog = false
    
    var body: some View {
        NavigationStack {
            EmployeeList(
                onLongPress: {
                    showDialog = true
                }
            )
            .navigationTitle("Employees")
            
        }
        .confirmationDialog("Select an Action", isPresented: $showDialog, actions: {
            Button("Copy") {
            }
            Button("Delete", role: .destructive) {
            }
        }, message: {
            Text("What would you like to do?")
        })
    }
}

#Preview {
    HomeView()
}
