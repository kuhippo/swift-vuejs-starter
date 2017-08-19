//
//  PageHandlers.swift
//  Perfect-App-Template
//
//  Created by Jonathan Guthrie on 2017-02-20.
//	Copyright (C) 2017 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//


import PerfectHTTP
import Foundation
import PerfectLib
import Stencil

extension HTTPResponse {
    public func render(template: String, context: [String: Any] = [String: Any](),isDev:Int = 0) {
        //设置路径
        var fsLoader:FileSystemLoader!
        if isDev == 1 {
            fsLoader = FileSystemLoader(paths: ["webroot/dist"])
        }else{
            fsLoader = FileSystemLoader(paths: ["webroot/"])
        }
        let environment = Environment(loader: fsLoader)
        
        do{
            let stencil = try environment.renderTemplate(name: "\(template)"+".html", context: context)
            self.setBody(string: stencil)
            self.completed()
        }catch{
            Log.error(message: "\(error)")
        }
        
    }
    //重定向
    public func redirect(path: String) {
        self.status = .found
        self.addHeader(.location, value: path)
        self.completed()
    }

}


