# Signature Verification via Zero-Knowledge Proofs

This repository demonstrates how to recover and verify an ECDSA signature using zero-knowledge proofs with [Noir](https://noir-lang.org/). The circuit ensures that a given signature was produced by the holder of a private key corresponding to a known public key, without revealing the private key itself.

## Overview

- **Signature Recovery:** Uses the [`ecrecover`](https://github.com/colinnielsen/ecrecover-noir) Noir library to recover the signer’s address from the signature and message hash.
- **Verification:** Asserts that the recovered address matches the expected address, proving the signature’s authenticity in zero knowledge.

## Circuit Logic

The main circuit ([src/main.nr](src/main.nr)):

- Accepts the public key, signature, hashed message, and expected address as inputs.
- Recovers the address from the signature and message.
- Verifies that the recovered address matches the expected address.

## Usage

### Prerequisites

- [Nargo](https://noir-lang.org/docs/getting-started/installation/) (Noir package manager)

### Build and Test

1. **Install dependencies:**
   ```sh
   nargo fetch
   ```

2. **Build the circuit:**
   ```sh
   nargo build
   ```

3. **Test the circuit:**
   ```sh
   nargo test
   ```

## Inputs

- `pub_key_x`: X coordinate of the public key (`[u8; 32]`)
- `pub_key_y`: Y coordinate of the public key (`[u8; 32]`)
- `signature`: ECDSA signature (`[u8; 64]`)
- `hashed_message`: Hash of the signed message (`[u8; 32]`)
- `expected_address`: The address expected to have signed the message (`Field`)

## Example

You can modify the `main` function in [src/main.nr](src/main.nr) to provide your own inputs for testing.

## Dependencies

- [`ecrecover`](https://github.com/colinnielsen/ecrecover-noir) Noir library for ECDSA signature recovery

## License

MIT

---

*Created by Hafiz Burhan