//
//  ResponseMessage+init.swift
//  CoinbaseWalletSDK
//
//  Created by Jungho Bang on 9/2/22.
//

import Foundation

extension ResponseMessage {
    public init(
        uuid: UUID = UUID(),
        sender: RainbowWalletSDK.PublicKey,
        content: ResponseContent,
        timestamp: Date = Date()
    ) {
        self.uuid = uuid
        self.sender = sender
        self.content = content
        self.version = RainbowWalletSDK.version
        self.timestamp = timestamp
        self.callbackUrl = nil
    }
}
