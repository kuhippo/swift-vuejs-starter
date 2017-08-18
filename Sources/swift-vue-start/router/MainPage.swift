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
    
    static func mainPage(data: [String:Any]) throws -> RequestHandler {
        return {
        req,res in
            res.render(template: "index")
        }
    }

}
