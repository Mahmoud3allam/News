//
//  UserDefaultsManager.swift
//  NewsSample
//
//  Created by Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
import Foundation
protocol UserDefaultsKeysProtocol {
    var rawValue: String { get }
}

protocol Storeable {
    var storeData: Data? { get }

    init?(storeData: Data?)
}

protocol UserDefaultsProtocol: AnyObject {
    func value<T>(key: UserDefaultsKeysProtocol) -> T?
    func write<T>(key: UserDefaultsKeysProtocol, value: T?)
    func remove(key: UserDefaultsKeysProtocol)

    func valueStoreable<T>(key: UserDefaultsKeysProtocol) -> T? where T: Storeable
    func writeStoreable<T>(key: UserDefaultsKeysProtocol, value: T?) where T: Storeable
    func wipe()
}

class UserDefaultsManager: UserDefaultsProtocol {
    fileprivate let userDefaults = UserDefaults.standard

    func value<T>(key: UserDefaultsKeysProtocol) -> T? {
        self.userDefaults.object(forKey: key.rawValue) as? T
    }

    func write<T>(key: UserDefaultsKeysProtocol, value: T?) {
        self.userDefaults.set(value, forKey: key.rawValue)
    }

    func remove(key: UserDefaultsKeysProtocol) {
        self.userDefaults.set(nil, forKey: key.rawValue)
    }

    func valueStoreable<T>(key: UserDefaultsKeysProtocol) -> T? where T: Storeable {
        let data: Data? = self.userDefaults.data(forKey: key.rawValue)
        return T(storeData: data)
    }

    func writeStoreable<T>(key: UserDefaultsKeysProtocol, value: T?) where T: Storeable {
        self.userDefaults.set(value?.storeData, forKey: key.rawValue)
    }

    func wipe() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            guard key != "AppleLanguages" else {
                return
            }
            defaults.removeObject(forKey: key)
        }
    }
}
