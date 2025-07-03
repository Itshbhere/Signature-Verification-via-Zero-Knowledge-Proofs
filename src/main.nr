use dep::ecrecover;
// use dep::std::convert::from_be_bytes;

fn main(
    pub_key_x: [u8; 32],
    pub_key_y: [u8; 32],
    signature: [u8; 64],
    hashed_message: [u8; 32],
    expected_address: Field,
) {
    // Step 1: Extract `s` from the signature
    // let mut s_bytes: [u8; 32] = [0; 32];
    // for i in 0..32 {
    //     s_bytes[i] = signature[32 + i];
    // }
    // let s = from_be_bytes(s_bytes);

    // // Step 2: Check if `s` is in upper half
    // // secp256k1 curve half order as a 32-byte big-endian array
    // let half_order_bytes: [u8; 32] = [
    //     0x7F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
    //     0xFF, 0x5D, 0x57, 0x6E, 0x73, 0x57, 0xA4, 0x50, 0x1D, 0xDF, 0xE9, 0x2F, 0x46, 0x68, 0x1B,
    //     0x20, 0xA0,
    // ];
    // let half_order: Field = from_be_bytes(half_order_bytes);
    // let s_int = s as u128;
    // let half_order_int = half_order as u128;
    // assert(s_int <= half_order_int, "Signature is in upper half and invalid");

    // Step 3: Proceed with ecrecover
    let address = ecrecover::ecrecover(pub_key_x, pub_key_y, signature, hashed_message);
    assert(address != 0, "Address cannot be zero");
    assert(address == expected_address, "Invalid signature or public key");
}
