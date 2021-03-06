//
//  LoggerInspectorDestination.swift
//  SwiftLoggerInspector
//
//  Created by Hadar on 4/27/16.
//  Copyright © 2016 hlandao. All rights reserved.
//

import Foundation
import XCGLogger

public class LoggerInspectorDestination: XCGFileLogDestination {
    
    var fileUrl: NSURL?
    
    override public init(owner: XCGLogger, writeToFile: AnyObject, identifier: String = "") {
        super.init(owner: owner, writeToFile: writeToFile, identifier: identifier)
        
        if writeToFile is NSString {
            fileUrl = NSURL.fileURLWithPath(writeToFile as! String)
        }
        else if writeToFile is NSURL {
            fileUrl = writeToFile as? NSURL
        }
        else {
            fileUrl = nil
        }
        
    }
    
    public func presentInspector() {
        guard let window = UIApplication.sharedApplication().delegate?.window else {
            return
        }
        
        let inspectorViewController = LoggerInspectorViewController(fileUrl: self.fileUrl)
        window?.rootViewController?.presentViewController(inspectorViewController, animated: true, completion: nil)
    }
}


