//
//  EncryptedResponseContent.swift
//  WalletSegue
//
//  Created by Jungho Bang on 6/23/22.
//

import Foundation
import CryptoKit

public enum EncryptedResponseContent: EncryptedContent {
    case response(requestId: UUID, data: Data)
    case failure(requestId: UUID, description: String)
    
    public func decrypt(with symmetricKey: SymmetricKey?) throws -> ResponseContent {
        switch self {
        case let .response(requestId, encryptedResults):
            guard let symmetricKey = symmetricKey else {
                throw RainbowWalletSDK.Error.missingSymmetricKey
            }
            let values: [ResponseContent.Value] = try Cipher.decrypt(encryptedResults, with: symmetricKey)
            return .response(requestId: requestId, values: values)
        case let .failure(requestId, description):
            return .failure(requestId: requestId, description: description)
        }
    }
    
    var requestId: UUID {
        switch self {
        case .response(let requestId, _),
             .failure(let requestId, _):
            return requestId
        }
    }
}

extension ResponseContent {
    public func encrypt(with symmetricKey: SymmetricKey?) throws -> EncryptedResponseContent {
        switch self {
        case let .response(requestId, results):
            guard let symmetricKey = symmetricKey else {
                throw RainbowWalletSDK.Error.missingSymmetricKey
            }
            let encrypted = try Cipher.encrypt(results, with: symmetricKey)
            return .response(requestId: requestId, data: encrypted)
        case let .failure(requestId, description):
            return .failure(requestId: requestId, description: description)
        }
    }
}

typealias EncryptedResponseMessage = EncryptedMessage<EncryptedResponseContent>
