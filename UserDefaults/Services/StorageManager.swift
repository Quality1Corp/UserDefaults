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
    
    func save(contact: Contact) {
        var contacts = fetchContact()
        contacts.append(contact)
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    func fetchContact() -> [Contact] {
        guard let data = userDefaults.data(forKey: key) else { return [] }
        guard let contacts = try? JSONDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContact()
        contacts.remove(at: index)
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: key)
    }
}
