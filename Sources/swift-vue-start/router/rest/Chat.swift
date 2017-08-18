//
//  Chat.swift
//  swiftStartKit
//
//  Created by mubin on 2017/8/18.
//
//

import Foundation
import PerfectLib
import PerfectHTTP


class Chat{
    
    static func test(data: [String:Any]) throws -> RequestHandler {
        return {
            req,res in
            do{

            }catch{
                Log.error(message: "\(error)")
            }
        }
    }
}
