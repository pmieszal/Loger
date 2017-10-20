//
//  ILogerProvider.swift
//  Loger
//
//  Created by Patryk Mieszała on 20.10.2017.
//

import Foundation

public protocol ILogerProvider {
    
    func verbose<T>(_ value: T, terminator: String, file: String, function: String, line: Int)
    func debug<T>(_ value: T, terminator: String, file: String, function: String, line: Int)
    func info<T>(_ value: T, terminator: String, file: String, function: String, line: Int)
    func error<T>(_ value: T, terminator: String, file: String, function: String, line: Int)
}

public extension ILogerProvider {
    
    public func verbose<T>(_ value: T, terminator: String = "", file: String = #file, function: String = #function, line: Int = #line) {
        verbose(value, terminator: terminator, file: file, function: function, line: line)
    }
    
    public func debug<T>(_ value: T, terminator: String = "", file: String = #file, function: String = #function, line: Int = #line) {
        debug(value, terminator: terminator, file: file, function: function, line: line)
    }
    
    public func info<T>(_ value: T, terminator: String = "", file: String = #file, function: String = #function, line: Int = #line) {
        info(value, terminator: terminator, file: file, function: function, line: line)
    }
    
    public func error<T>(_ value: T, terminator: String = "", file: String = #file, function: String = #function, line: Int = #line) {
        error(value, terminator: terminator, file: file, function: function, line: line)
    }
}
