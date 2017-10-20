//
//  LogerProvider.swift
//  Loger
//
//  Created by Patryk Mieszała on 20.10.2017.
//

import Foundation

public final class LogerProvider: ILogerProvider, ILogerProviderSetup {
    
    // MARK: - Singleton Instance
    public static let shared = LogerProvider()
    
    // MARK: - Private Member(s)
    private var loger: Loger?
    
    // MARK: - Public Member(s)
    
    // - MARK: Constructor(s)
    private init() {
    }
    
    // - MARK: Public Method(s)
    public func setup(logLevel: LogLevel, format: @escaping LogEntryFormat, endpoint: @escaping LogOutputEndpoint) {
        loger = Loger(logLevel: logLevel, format: format, endpoint: endpoint)
    }
    
    public func verbose<T>(_ value: T, terminator: String, file: String, function: String, line: Int) {
        loger?.log(value, level: .verbose, terminator: terminator, file: file, function: function, line: line)
    }
    
    public func debug<T>(_ value: T, terminator: String, file: String, function: String, line: Int) {
        loger?.log(value, level: .debug, terminator: terminator, file: file, function: function, line: line)
    }
    
    public func info<T>(_ value: T, terminator: String, file: String, function: String, line: Int) {
        loger?.log(value, level: .info, terminator: terminator, file: file, function: function, line: line)
    }
    
    public func error<T>(_ value: T, terminator: String, file: String, function: String, line: Int) {
        loger?.log(value, level: .error, terminator: terminator, file: file, function: function, line: line)
    }
    
    // - MARK: Private Method(s)
}
