//
//  BitcoinBlockchain.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-07-02.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Foundation
import Starscream

class BitcoinBlockchain: NSObject {
    fileprivate var socket = WebSocket(url: URL(string: "wss://ws.blockchain.info/inv")!)
    
    override init() {
        super.init()
        
        self.socket.delegate = self
        self.socket.connect()
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(sendPing), userInfo: nil, repeats: true)
    }
    
    /**
     * Sends ping to keep the websocket alive.
     */
    public func sendPing() {
        debugPrint("Ping")
        self.socket.write(string: "{\"op\":\"ping\"}")
    }
}

extension BitcoinBlockchain: WebSocketDelegate {
    func websocketDidConnect(socket: WebSocket) {
        debugPrint("websocketDidConnect")
    }
    
    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        debugPrint("websocketDidDisconnect")
    }
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        debugPrint("websocketDidReceiveMessage")
    }
    
    func websocketDidReceiveData(socket: WebSocket, data: Data) {
        debugPrint("websocketDidReceiveData")
    }
}

extension BitcoinBlockchain: WebSocketPongDelegate {
    func websocketDidReceivePong(socket: WebSocket, data: Data?) {
        debugPrint("websocketDidReceivePong")
    }
}
