//
//  KeyStorageItem.swift
//  WalletSegue
//
//  Created by Jungho Bang on 6/17/22.
//

import Foundation

struct KeyStorageItem<K: RawRepresentableKey> {
    let name: String
    
    init(_ name: String) {
        self.name = name
    }

    static var ownPrivateKey: KeyStorageItem<RainbowWalletSDK.PrivateKey> {
        return KeyStorageItem<RainbowWalletSDK.PrivateKey>("wsegue.ownPrivateKey")
    }
    
    static var peerPublicKey: KeyStorageItem<RainbowWalletSDK.PublicKey> {
        return KeyStorageItem<RainbowWalletSDK.PublicKey>("wsegue.peerPublicKey")
    }
}
