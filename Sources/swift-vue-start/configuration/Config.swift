//
//  Config.swift
//  swiftStartKit
//
//  Created by mubin on 2017/8/17.
//
//

import Foundation
import PostgreSQL

func config(){
    
    //1.setp-----sql 配置
    let postgresTestConnInfo = "host=localhost dbname=postgres"
    let p = PGConnection()
    let status = p.connectdb(postgresTestConnInfo)
    
    guard status != .bad else{
        //连接失败
        fatalError("\(p.errorMessage())")
    }
    
    let res = p.exec(statement: "CREATE TABLE users ( id serial PRIMARY KEY, username varchar(20) NOT NULL, age integer)")
    
    let _ = p.exec(statement: "INSERT INTO users(username,age) values('john',10)")
    let _ = p.exec(statement: "INSERT INTO users(username,age) values('mubin',11)")
    let _ = p.exec(statement: "INSERT INTO users(username,age) values('wulitaotao',24)")
    
    

}
