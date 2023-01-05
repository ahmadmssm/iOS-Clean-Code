//
//  EnvironmentUtils.swift
//  EnvironmentVariables
//
//  Created by Ahmad Mahmoud on 04/01/2023.
//

public class EnvironmentUtils {
    
    public static func isRobustaStagingScheme() -> Bool {
        #if ROBUSTA_STAGING
        return true
        #else
        return false
        #endif
    }
    
    public static func doIfDebug(action: () -> Void) {
        #if DEBUG
        action()
        #endif
    }
    
    public static func doIfDebug(action: () -> Void, fallbackAction: () -> Void) {
        #if DEBUG
        action()
        #else
        fallbackAction()
        #endif
    }
    
    public static func doIfRelease(action: () -> Void) {
        #if !DEBUG
        action()
        #endif
    }
    
    public static func doIfDebugOrRelease(debugAction: () -> Void, releaseAction: () -> Void) {
        #if DEBUG
        debugAction()
        #else
        releaseAction()
        #endif
    }
    
    public static func doIfStaging(action: () -> Void) {
        #if STAGING
        action()
        #endif
    }
    
    public static func doIfProduction(action: () -> Void) {
        #if PRODUCTION
        action()
        #endif
    }
    
    public static func doIfStagingOrProduction(stagingAction: () -> Void, productionAction: () -> Void) {
        #if STAGING
        stagingAction()
        #else
        productionAction()
        #endif
    }
}
