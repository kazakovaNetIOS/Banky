//
//  StorageController.swift
//  Banky
//
//  Created by Natalia Kazakova on 08/08/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import Foundation

class StorageController {
    fileprivate let documentsDirectoryURL = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask)
        .first!
    
    fileprivate var accountsFileURL: URL {
        return documentsDirectoryURL
            .appendingPathComponent("Accounts")
            .appendingPathExtension("plist")
    }
    
    func save(_ accounts: [Account]) {
        let accountsPlist = accounts.map { $0.plistRepresentation } as NSArray
        accountsPlist.write(to: accountsFileURL, atomically: true)
    }
    
    func fetchAccounts() -> [Account] {
        guard let accountPlists = NSArray(contentsOf: accountsFileURL) as? [[String: AnyObject]] else {
            return []
        }
        return accountPlists.map(Account.init(plist:))
    }
}
