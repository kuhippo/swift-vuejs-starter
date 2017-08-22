//
//  Config.swift
//  swiftStartKit
//
//  Created by mubin on 2017/8/17.
//
//

import Foundation
import PostgreSQL
import PerfectLib


let postgresTestConnInfo = "host=localhost dbname=postgres"
func config(){
    
    
    let p = PGConnection()
    let status = p.connectdb(postgresTestConnInfo)
    
    guard status != .bad else{
        //连接失败
        fatalError("\(p.errorMessage())")
    }
    
    
    //添加测试数据
    let userres = p.exec(statement: "CREATE TABLE users ( id serial PRIMARY KEY, username varchar(20) NOT NULL, age integer)")
    let topicres = p.exec(statement: "CREATE TABLE topics ( id serial PRIMARY KEY, user_id integer ,title varchar(20) NULL, content varchar(20))")
    
    
    guard userres.status() == .commandOK && topicres.status() == .commandOK else {
        Log.error(message: "\(userres.errorMessage())\(topicres.errorMessage())")
        userres.clear()
        topicres.clear()
        return
    }
    
    let _ = p.exec(statement: "INSERT INTO users(username,age) values('john',10)")
    
    let _ = p.exec(statement: "INSERT INTO topics(user_id,title,content) values(10,'文章1','fffffccckkk')")
    let _ = p.exec(statement: "INSERT INTO topics(user_id,title,content) values(10,'文章2','seven color')")
    let _ = p.exec(statement: "INSERT INTO topics(user_id,title,content) values(10,'文章3',':-D :-D :-D')")
    
    userres.clear()
    topicres.clear()
    p.finish()
    
    
}
