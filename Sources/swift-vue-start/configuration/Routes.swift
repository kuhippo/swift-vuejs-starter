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
	               "allowResponseFilters":true])
    
    routes.append(["method":"get", "uri":"/", "handler":MainPage.mainPage])
    
    //api -restful
    routes.append(["method":"get", "uri":"/rest/test", "handler":SampleRest.test])
    routes.append(["method":"get", "uri":"/rest/user/{userId}/posts","handler":SampleRest.userposts])
    routes.append(["method":"get", "uri":"/rest/user/{userId}/settings","handler":SampleRest.userSettings])
    
    
    routes.append(["method":"get", "uri":"/chat", "handler":chatHandler])
    routes.append(["method":"get", "uri":"/sse", "handler":MainPage.sse])
    
	return routes
}
