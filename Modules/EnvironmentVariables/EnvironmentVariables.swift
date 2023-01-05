//
//  EnvironmentVariables.swift
//  EnvironmentVariables
//
//  Created by Ahmad Mahmoud on 04/01/2023.
//

import Foundation

public class EnvironmentVariables {
    
    enum PlistKey: String {
        case baseURL
        
        func value() -> String {
            let description = self.rawValue
            return description.prefix(1).capitalized + description.dropFirst()
        }
    }
    
    public static var appId: String {
        return Bundle.main.bundleIdentifier!
    }
    
    public static var baseURL: String {
        return self.configuration(.baseURL)
    }
    
    private static var infoDict: [String: Any] {
        if let dict = Bundle.main.infoDictionary {
            return dict
        }
        else {
            fatalError("Plist file not found")
        }
    }
    
    private static func configuration(_ key: PlistKey) -> String {
        guard let keyValue = infoDict[key.value()] as? String else {
            fatalError("Key \(key.value()) Not founded")
        }
        return keyValue
    }
    
    static var isProduction: Bool {
        #if PRODUCTION
        return true
        #else
        return false
        #endif
    }
}
