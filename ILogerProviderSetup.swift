//
//  ILogerProviderSetup.swift
//  Loger
//
//  Created by Patryk Mieszała on 20.10.2017.
//

import Foundation

public protocol ILogerProviderSetup {
    
    func setup(logLevel: LogLevel, format: @escaping LogEntryFormat, endpoint: @escaping LogOutputEndpoint)
}

public extension ILogerProviderSetup {
    
    public func setup(logLevel: LogLevel) {
        setup(logLevel: logLevel, format: Loger.LogEntryDefaultFormat, endpoint: Loger.LogOutputDefaultEndpoint)
    }
    
    public func setup(logLevel: LogLevel, endpoint: @escaping LogOutputEndpoint) {
        setup(logLevel: logLevel, format: Loger.LogEntryDefaultFormat, endpoint: endpoint)
    }
    
    public func setup(logLevel: LogLevel, format: @escaping LogEntryFormat) {
        setup(logLevel: logLevel, format: format, endpoint: Loger.LogOutputDefaultEndpoint)
    }
}
