//
//  StateController.swift
//  Banky
//
//  Created by Natalia Kazakova on 08/08/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import Foundation

class StateController {
    fileprivate let storageController: StorageController
    fileprivate(set) var accounts: [Account]
    
    init(storageController: StorageController) {
        self.storageController = storageController
        self.accounts = storageController.fetchAccounts()
    }
    
    func add(_ account: Account) {
        accounts.append(account)
        storageController.save(accounts)
    }
    
    func update(_ account: Account) {
        for (index, storedAccount) in accounts.enumerated() {
            guard storedAccount.number == account.number else {
                continue
            }
            accounts[index] = account
            storageController.save(accounts)
            break
        }
    }
}
