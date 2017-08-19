//
//  MainPage.swift
//  swiftStartKit
//
//  Created by mubin on 2017/8/18.
//
//

import Foundation
import PerfectLib
import PerfectHTTP

class MainPage{
    
    static func sse(data: [String:Any]) throws -> RequestHandler {
        return{
            req,res in
            res.render(template: "sse/index")
        }
    }

    static func mainPage(data: [String:Any]) throws -> RequestHandler {
        return {
        req,res in
            if devOrpro == 0 {
                res.render(template: "index")
            }else{
                res.render(template: "index", isDev: 1)
            }
        }
    }

}
