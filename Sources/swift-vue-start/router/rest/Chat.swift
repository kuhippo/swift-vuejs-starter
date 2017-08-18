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
import PerfectWebSockets

class Chat{
    
    static func test(data: [String:Any]) throws -> RequestHandler {
        return {
            request,response in
            
            // Provide your closure which will return the service handler.
            WebSocketHandler(handlerProducer: {
                (request: HTTPRequest, protocols: [String]) -> WebSocketSessionHandler? in
                
                // Check to make sure the client is requesting our "echo" service.
                guard protocols.contains("echo") else {
                    return nil
                }
                
                // Return our service handler.
                return EchoHandler()
            }).handleRequest(request: request, response: response)
        }
    }
    
}
class EchoHandler: WebSocketSessionHandler {
    
    // The name of the super-protocol we implement.
    // This is optional, but it should match whatever the client-side WebSocket is initialized with.
    let socketProtocol: String? = "echo"
    
    // This function is called by the WebSocketHandler once the connection has been established.
    func handleSession(request: HTTPRequest, socket: WebSocket) {
        
        // Read a message from the client as a String.
        // Alternatively we could call `WebSocket.readBytesMessage` to get the data as an array of bytes.
        socket.readStringMessage {
            // This callback is provided:
            //  the received data
            //  the message's op-code
            //  a boolean indicating if the message is complete
            // (as opposed to fragmented)
            string, op, fin in
            
            // The data parameter might be nil here if either a timeout
            // or a network error, such as the client disconnecting, occurred.
            // By default there is no timeout.
            guard let string = string else {
                // This block will be executed if, for example, the browser window is closed.
                socket.close()
                return
            }
            
            // Print some information to the console for informational purposes.
            print("Read msg: \(string) op: \(op) fin: \(fin)")
            
            socket.sendStringMessage(string: string, final: true) {
                
                
                self.handleSession(request: request, socket: socket)
            }
        }
    }
}
