//
//  NewContactViewController.swift
//  UserDefaults
//
//  Created by MikhaiL on 25.05.2023.
//

import UIKit

final class NewContactViewController: UIViewController {
    
    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var firstNameTF: UITextField!
    @IBOutlet var lastNameTF: UITextField!
    
    weak var delegate: NewContactViewControllerDelegate!
    
    private let storageManager = StorageManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let action = UIAction { [weak self] _ in
            guard let firstName = self?.firstNameTF.text else { return }
            self?.doneButton.isEnabled = !firstName.isEmpty
        }
        firstNameTF.addAction(action, for: .editingChanged)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        save()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func save() {
        guard let firstName = firstNameTF.text else { return }
        guard let lastName = lastNameTF.text else { return }
        
        let contact = Contact(firstName: firstName, lastName: lastName)
        storageManager.save(contact: contact)
        
        delegate.add(contact: contact)
        dismiss(animated: true)
    }
}
