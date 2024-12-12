//
//  EmployeeViewModel.swift
//  SwiftUICombine
//
//  Created by Harshit Rastogi on 11/12/24.
//

import Foundation
import Combine

class EmployeeViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var employees: [Employee] = []
    private var cancellables = Set<AnyCancellable>()
    
    func fetchEmployees() {
        isLoading = true
        NetworkManager.shared.getData(type: EmployeeResponse.self)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] employeeData in
                self?.employees = employeeData.data  ?? []
            }
            .store(in: &cancellables)
    }
    
    func copyEmployee(_ employee: Employee) {
        let newEmployee = Employee(id: employees.count + 1, employee_name: employee.employee_name, employee_salary: employee.employee_salary, employee_age: employee.employee_age, profile_image: employee.profile_image)
        employees.append(newEmployee)
    }
    
    func deleteEmployee(_ employee: Employee) {
        employees.removeAll { $0.id == employee.id }
    }
}
