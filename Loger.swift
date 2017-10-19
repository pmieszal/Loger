//
//  Loger.swift
//  Loger
//
//  Created by Patryk Mieszała on 19.10.2017.
//

import Foundation

public enum LogLevel: Int, CustomStringConvertible {
    
    case verbose = 0
    case debug = 1
    case info = 2
    case warning = 3
    case error = 4
    
    public var description: String {
        switch self {
        case .verbose:  return "verbose"
        case .debug:    return "debug"
        case .info:     return "info"
        case .warning:  return "warning"
        case .error:    return "error"
        }
    }
    
    func shouldLog(consideringMinimum level: LogLevel) -> Bool {
        return self.rawValue >= level.rawValue
    }
}

public typealias LogEntryFormat = (LogEntry) -> String
public typealias LogOutputEndpoint = (LogOutput) -> Void

class Loger {
    
    static var LogEntryDefaultFormat: LogEntryFormat = { entry -> String in
        let date: Date = Date()
        
        let df = DateFormatter()
        df.dateFormat = "HH:mm:ss"
        
        let time = df.string(from: date)
        
        let filename = ((entry.file as NSString).lastPathComponent as NSString).deletingPathExtension
        
        return "(\(time)) \(filename).\(entry.function)[\(entry.line)] \(entry.level.description.uppercased()) - \(entry.value)\n"
    }
    
    static var LogOutputDefaultEndpoint: LogOutputEndpoint = { (output) in
        print(output.message, terminator: output.terminator)
    }
    
    private let minimumLogLevel: LogLevel
    private let format: LogEntryFormat
    private let endpoint: LogOutputEndpoint
    
    init(logLevel: LogLevel, format: @escaping LogEntryFormat, endpoint: @escaping LogOutputEndpoint) {
        self.minimumLogLevel = logLevel
        self.format = format
        self.endpoint = endpoint
        
        let entry = LogEntry(value: "Setting up Logger with level: \(minimumLogLevel).", level: .info, file: #file, function: #function, line: #line)
        
        let message = format(entry)
        
        let output = LogOutput(message: message, terminator: "")
        endpoint(output)
    }
    
    @inline(__always) func log<T>(_ value: T, level: LogLevel, terminator: String = "", file: String, function: String, line: Int) {
        guard level.shouldLog(consideringMinimum: self.minimumLogLevel) == true else { return }
        let entry = LogEntry(value: value, level: level, file: file, function: function, line: line)
        let message = format(entry)
        
        let output = LogOutput(message: message, terminator: terminator)
        endpoint(output)
    }
}

public struct LogEntry {
    
    let value: Any
    let level: LogLevel
    let file: String
    let function: String
    let line: Int
    
}

public struct LogOutput {
    
    let message: String
    let terminator: String
    
}
