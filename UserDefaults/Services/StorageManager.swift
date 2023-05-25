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
    
    private let fileURL = URL.documentsDirectory.appending(path: "Contact").appendingPathExtension("plist")
    
    func save(contact: Contact) {
        var contacts = fetchContact()
        contacts.append(contact)
        guard let data = try? PropertyListEncoder().encode(contacts) else { return }
        try? data.write(to: fileURL, options: .noFileProtection)
    }
    
    func fetchContact() -> [Contact] {
        guard let data = try? Data(contentsOf: fileURL) else { return [] }
        guard let contacts = try? PropertyListDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContact()
        contacts.remove(at: index)
        guard let data = try? PropertyListEncoder().encode(contacts) else { return }
        try? data.write(to: fileURL, options: .noFileProtection)
    }
}
