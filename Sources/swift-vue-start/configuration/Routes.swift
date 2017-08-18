//
//  Routes.swift
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

import PerfectHTTPServer
import PerfectLib
import PerfectHTTP


func mainRoutes() -> [[String: Any]] {
    
	var routes: [[String: Any]] = [[String: Any]]()

	routes.append(["method":"get", "uri":"/**", "handler":PerfectHTTPServer.HTTPHandler.staticFiles,
	               "documentRoot":"./webroot",
	               "allowRequestFilter":false,
	               "allowResponseFilters":true])
    
    //api -restful
    routes.append(["method":"get", "uri":"/", "handler":MainPage.mainPage])
    
    routes.append(["method":"get", "uri":"/echo", "handler":Chat.test])
	
	return routes
}
