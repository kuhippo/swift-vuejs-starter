//
//  main.swift
//  PerfectTemplate
//
//  Created by Kyle Jessup on 2015-11-05.
//	Copyright (C) 2015 PerfectlySoft, Inc.
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

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

//1.setp-----database配置
config()

//2.setp-----http 配置
var confData: [String:[[String:Any]]] = [
    "servers": [
        [
            "name":"Chat",
            "port":8181,
            "routes":[],
            "filters":[]
        ]
    ]
]
//3.setp------设置开发环境或生产环境  0 为 开发 1 为生产
let devOrpro = 0

confData["servers"]?[0]["filters"] = filters()

confData["servers"]?[0]["routes"] = mainRoutes()

//3.setp-----run
do {
	// Launch the servers based on the configuration data.
	try HTTPServer.launch(configurationData: confData)
} catch {
	fatalError("\(error)") // fatal error launching one of the servers
}

