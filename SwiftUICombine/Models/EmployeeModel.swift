//
//  EmployeeModel.swift
//  SwiftUICombine
//
//  Created by Harshit Rastogi on 10/12/24.
//

import Foundation

struct EmployeeResponse: Codable {
    let status: String?
    let data: [Employee]?
    let message: String?
}

struct Employee: Identifiable, Codable {
    let id: Int?
    let employee_name: String?
    let employee_salary: Int?
    let employee_age: Int?
    let profile_image: String?
}
