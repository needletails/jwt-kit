import CryptoExtras

#if !canImport(Darwin)
import FoundationEssentials
#else
import Foundation
#endif

@available(anyAppleOS 26.0, *)
@_spi(PostQuantum)
public enum MLDSA: Sendable {}

@available(anyAppleOS 26.0, *)
extension MLDSA {
    public struct PublicKey<KeyType>: MLDSAKey where KeyType: MLDSAType {
        public typealias MLDSAType = KeyType

        typealias PublicKey = KeyType.PrivateKey.PublicKey

        let backing: any MLDSAPublicKey

        public init(backing: some MLDSAPublicKey) {
            self.backing = backing
        }

        public init(rawRepresentation: some DataProtocol) throws {
            self.backing = try PublicKey(rawRepresentation: rawRepresentation)
        }
    }
}

@available(anyAppleOS 26.0, *)
extension MLDSA {
    public struct PrivateKey<KeyType>: MLDSAKey where KeyType: MLDSAType {
        public typealias MLDSAType = KeyType

        typealias PrivateKey = KeyType.PrivateKey

        let backing: any MLDSAPrivateKey

        public var publicKey: MLDSA.PublicKey<KeyType> {
            .init(backing: self.backing.publicKey)
        }

        public init(backing: some MLDSAPrivateKey) {
            self.backing = backing
        }

        public init(seedRepresentation: some DataProtocol, publicKey: KeyType.PrivateKey.PublicKey? = nil) throws {
            self.backing = try PrivateKey(seedRepresentation: seedRepresentation, publicKey: publicKey)
        }
    }
}
