//
//  ExampleTest.swift
//  CoinbaseWalletSDK-Unit-Test
//
//  Created by Jungho Bang on 10/7/22.
//

import XCTest
@testable import RainbowWalletSDK

class ExampleTest: XCTestCase {

    func testCoinbaseWalletSDKConfigure() {
        XCTAssertFalse(RainbowWalletSDK.isConfigured)
        
        RainbowWalletSDK.configure(callback: URL(string: "myappxyz://mycallback")!)
        XCTAssertTrue(RainbowWalletSDK.isConfigured)
    }

}
