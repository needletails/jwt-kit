import Crypto

@available(anyAppleOS 26.0, *)
@_spi(PostQuantum)
extension MLDSA87.PublicKey: MLDSAPublicKey {
    public typealias MLDSAType = MLDSA87
}

@available(anyAppleOS 26.0, *)
@_spi(PostQuantum)
extension MLDSA87.PrivateKey: MLDSAPrivateKey {
    public typealias MLDSAType = MLDSA87
}

@available(anyAppleOS 26.0, *)
@_spi(PostQuantum)
public typealias MLDSA87PublicKey = MLDSA.PublicKey<MLDSA87>

@available(anyAppleOS 26.0, *)
@_spi(PostQuantum)
public typealias MLDSA87PrivateKey = MLDSA.PrivateKey<MLDSA87>
