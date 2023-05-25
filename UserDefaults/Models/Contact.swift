//
//  Contact.swift
//  UserDefaults
//
//  Created by MikhaiL on 25.05.2023.
//

struct Contact: Codable {
    let firstName: String
    let lastName: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
