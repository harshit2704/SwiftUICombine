//
//  HomeView.swift
//  SwiftUICombine
//
//  Created by Harshit Rastogi on 10/12/24.
//

import SwiftUI

struct HomeView: View {
    @State private var showDialog = false
    @StateObject private var viewModel = EmployeeViewModel()
    @State private var selectedEmployee: Employee?
    
    var body: some View {
        NavigationStack {
            ZStack {
                EmployeeList(
                    viewModel: viewModel, onLongPress: { employee in
                        showDialog = true
                        selectedEmployee = employee
                    }
                )
                .navigationTitle("Employees")
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                }
            }
        }
        .onAppear{
            viewModel.fetchEmployees()
        }
        .confirmationDialog("Select an Action", isPresented: $showDialog, actions: {
            Button("Copy") {
                if let employee = selectedEmployee {
                    viewModel.copyEmployee(employee)
                }
            }
            Button("Delete", role: .destructive) {
                if let employee = selectedEmployee {
                    viewModel.deleteEmployee(employee)
                }    
            }
        }, message: {
            Text("What would you like to do?")
        })
    }
}

#Preview {
    HomeView()
}
