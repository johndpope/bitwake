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
    
    fileprivate func transactionFromJsonResponse(_ jsonResponse: [String: Any]) {
        let transactionId = jsonResponse["hash"] as! String
        let outs = jsonResponse["out"] as! [[String: Any]]
        
        let transaction = Transaction(transactionId: transactionId)
        
        for out in outs {
            let toAddress = out["addr"] as! String
            let value = out["value"] as! Float?
            
            if value != nil {
                transaction.addOut(address: toAddress, amount: value!)
            }
            debugPrint(out)
        }
        
        debugPrint("")
    }
    
    /**
     * Triggers API to send info about latest transaction.
     */
    fileprivate func debugTriggerLastTransactionInfo() {
        self.socket.write(string: "{\"op\":\"ping_tx\"}")
    }
    
    /**
     * Sends ping to keep the websocket alive.
     */
    private func sendPing() {
        debugPrint("Ping")
        self.socket.write(string: "{\"op\":\"ping\"}")
    }
    
    public func subscribe(_ wallet: Wallet) {
        if let address = wallet.address {
            let jsonDict = ["op": "addr_sub", "addr": address]
            debugPrint("Subscribing to wallet \(address)")
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: jsonDict, options: .prettyPrinted)
                self.socket.write(data: jsonData)
            }
            catch let error {
                debugPrint(error)
            }
        }
    }
}

extension BitcoinBlockchain: WebSocketDelegate {
    func websocketDidConnect(socket: WebSocket) {
        debugPrint("websocketDidConnect")
        
        self.debugTriggerLastTransactionInfo()
    }
    
    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        debugPrint("websocketDidDisconnect")
    }
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        debugPrint("websocketDidReceiveMessage")
        debugPrint("\(text)")
        
        do {
            let jsonDict = try JSONSerialization.jsonObject(with: text.data(using: .utf8)!, options: .allowFragments) as! [String: Any]
            debugPrint(jsonDict)
            
            if let operation = jsonDict["op"] as! String? {
                
                if operation == "utx" {
                    debugPrint(jsonDict["x"] as! [String: Any])
                    let transactionJsonDict = jsonDict["x"] as! [String: Any]
                    let transaction = self.transactionFromJsonResponse(transactionJsonDict)
                }
            }
        }
        catch let error {
            debugPrint(error)
        }
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
