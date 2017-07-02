//
//  BitcoinBlockchain.swift
//  BitWake
//
//  Created by Niklas Berglund on 2017-07-02.
//  Copyright © 2017 Niklas Berglund. All rights reserved.
//

import Foundation
import Starscream

class BitcoinBlockchain {
    fileprivate var socket = WebSocket(url: URL(string: "wss://ws.blockchain.info/inv")!)
    
    init() {
        self.socket.delegate = self
        self.socket.connect()
        
        // API specifies that ping must be sent in order to keep the connection alive:
        // "If you do not need any data, but want to keep it open, you should send a ping every 30 seconds"
        Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { (timer) in
            self.sendPing()
        }
    }
    
    /**
     * Sends ping to keep the websocket alive.
     */
    private func sendPing() {
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
        debugPrint("\(text)")
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
