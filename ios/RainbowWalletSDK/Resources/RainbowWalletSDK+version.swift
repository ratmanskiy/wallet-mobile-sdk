//
//  CoinbaseWalletSDK+version.swift
//  WalletSegue
//
//  Created by Jungho Bang on 9/12/22.
//

import Foundation

extension RainbowWalletSDK {
    // CFBundleShortVersionString doesn't exist if the SDK is built as a static library.
    static private(set) var version = "1.1.0"
    
    #if CROSS_PLATFORM
    static public func appendVersionTag(_ tag: String) {
        self.version += "/\(tag)"
    }
    #endif
}
