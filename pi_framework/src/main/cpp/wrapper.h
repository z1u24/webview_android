#ifndef __ETH_BTC_WRAPPER__
#define __ETH_BTC_WRAPPER__

/* Warning, this file is autogenerated by cbindgen. Don't modify this manually. */

#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

int32_t btc_build_pay_to_pub_key_hash(const char *address, char **script_pubkey);

int32_t btc_build_raw_transaction_from_single_address(const char *address,
                                                      const char *priv_key,
                                                      const char *input,
                                                      const char *output,
                                                      char **raw_tx,
                                                      char **tx_hash);

int32_t btc_from_mnemonic(const char *mnemonic,
                          const char *network,
                          const char *language,
                          const char *pass_phrase,
                          char **root_xpriv,
                          char **root_seed);

int32_t btc_from_seed(const char *seed,
                      const char *network,
                      const char *language,
                      char **root_xpriv);

int32_t btc_generate(uint32_t strength,
                     const char *network,
                     const char *language,
                     const char *pass_phrase,
                     char **root_xpriv,
                     char **mnemonic);

int32_t btc_private_key_of(uint32_t index, const char *root_xpriv, char **priv_key);

int32_t btc_to_address(const char *network, const char *priv_key, char **address);

void dealloc_rust_buffer(uint8_t *buf, uintptr_t len);

void dealloc_rust_cstring(char *cstring);

int32_t eth_from_mnemonic(const char *mnemonic,
                          const char *language,
                          char **address,
                          char **priv_key,
                          char **master_seed);

int32_t eth_generate(uint32_t strength,
                     const char *language,
                     char **address,
                     char **priv_key,
                     char **master_seed,
                     char **mnemonic);

int32_t eth_select_wallet(const char *language,
                          const char *master_seed,
                          uint32_t index,
                          char **address,
                          char **priv_key);

int32_t eth_sign_raw_transaction(uint8_t chain_id,
                                 const char *nonce,
                                 const char *to,
                                 const char *value,
                                 const char *gas,
                                 const char *gas_price,
                                 const char *data,
                                 const char *priv_key,
                                 char **tx_hash,
                                 char **serialized);

int32_t get_public_key_by_mnemonic(const char *mnemonic, const char *language, char **public_key);

int32_t rust_decrypt(const char *key,
                     const char *nonce,
                     const char *aad,
                     const char *cipher_text,
                     char **out_plain_text);

int32_t rust_encrypt(const char *key,
                     const char *nonce,
                     const char *aad,
                     const char *plain_text,
                     char **out_cipher_text);

int32_t rust_sha256(const char *data, char **hash);

int32_t rust_sign(const char *priv_key, const char *msg, char **signature);

char *token_balance_call_data(const char *addr);

char *token_transfer_call_data(const char *addr_to, const char *value);


#ifdef __cplusplus
}
#endif

#endif /* __ETH_BTC_WRAPPER__ */
