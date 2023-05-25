//
//  StorageManager.swift
//  UserDefaults
//
//  Created by MikhaiL on 25.05.2023.
//

import Foundation

final class StorageManager {
    static let shared = StorageManager()
    private init() {}
    
    private let userDefaults = UserDefaults.standard
    private let key = "contacts"
    
    func save(contact: String) {
        var contacts = fetchContact()
        contacts.append(contact)
        userDefaults.set(contacts, forKey: key)
    }
    
    func fetchContact() -> [String] {
        if let contacts = userDefaults.stringArray(forKey: key) {
            return contacts
        }
        return []
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContact()
        contacts.remove(at: index)
        userDefaults.set(contacts, forKey: key)
    }
}
