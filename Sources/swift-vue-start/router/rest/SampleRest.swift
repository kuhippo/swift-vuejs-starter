//
//  SampleRest.swift
//  swiftStartKit
//
//  Created by mubin on 2017/8/18.
//
//

import Foundation
import PerfectLib
import PerfectHTTP
import PostgreSQL

class SampleRest{
    
    static func test(data: [String:Any]) throws -> RequestHandler {
        return {
            req,res in
            do{
                let json = try ["Vue.js","is","great"].jsonEncodedString()
                let jsonDecode =  try json.jsonDecode()
                try res.setBody(json: jsonDecode)
                res.completed()
            }catch{
                Log.error(message: "\(error)")
            }
        }
    }
    
    static func userposts(data: [String:Any]) throws -> RequestHandler {
        return {
            req,res in
            
            var resultTopics:PGResult?
            var p:PGConnection?
            do{
                
                guard let user = req.urlVariables["userId"] else{
                    try res.setBody(json: ["msg":"获取失败"])
                    res.completed()
                    return
                }
                
                p = PGConnection()
                
                guard p!.connectdb(postgresTestConnInfo) == .ok else{
                    Log.error(message: "未知错误")
                    return
                }
                
                resultTopics = p!.exec(statement: "select user_id,title,content from topics where user_id = 10")
                
                let num = resultTopics!.numTuples()
                
                var topicArr:[[String:String]] = []
                
                for x in 0..<num {
                    let user_id = resultTopics!.getFieldInt(tupleIndex: x, fieldIndex: 0) ?? 0
                    let title = resultTopics!.getFieldString(tupleIndex: x, fieldIndex: 1) ?? ""
                    let content = resultTopics!.getFieldString(tupleIndex: x, fieldIndex: 2) ?? ""
                    
                    let dic = ["user_id":"\(user_id)","title":title,"content":content]
                    topicArr.append(dic)
                }
                
                 let topicDecode =  try topicArr.jsonEncodedString().jsonDecode()
                
                try res.setBody(json: topicDecode)
                res.completed()
                
            }catch{
                Log.error(message: "\(error)")
            }
            
            defer {
                resultTopics?.clear()
                p?.finish()
            }
        }
    }
    
    static func userSettings(data: [String:Any]) throws -> RequestHandler {
        return {
            req,res in
            do{
                guard let user = req.urlVariables["userId"] else{
                    try res.setBody(json: ["msg":"获取失败"])
                    res.completed()
                    return
                }
                var settings:[String] = []
                for x in 0...10{
                    settings.append("Seting # + \(x) + of user \(user)")
                }
                
                let topicDecode =  try settings.jsonEncodedString().jsonDecode()
                try res.setBody(json: topicDecode)
                res.completed()
            }catch{
                Log.error(message: "\(error)")
            }
        }
    }
    
}
