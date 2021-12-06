//
//  Employee.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-12-03.
//

import Foundation

class Employee: Codable {
    var id: Int?
    var name: String?
    
    enum odingKeys: String, CodingKey {
        case id
        case name = "employee_name"
    }
}

struct EmployeeResponce: Codable {
    var status: String?
    var data: [Employee]
    var message: String?
}
