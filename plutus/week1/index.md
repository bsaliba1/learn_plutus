# Week 1
## Basic UTxO
- UTxO = "Unspent Transaction Output Model"
- Input amount of a transaction should equal the output amount
- If Alice has one UTxO of 100 ADA and wants to send 10 ADA to Bob then the transaction would look as such:
  - Input: (Alice) 100 ADA
  - Output: (Alice) 90 ADA, (Bob) 10 ADA
- To authenticate transactions, signatures are sent with a transaction

## (E)UTxO
- (E)UTxO = "Extended Unspent Transaction Output Model"
- Description: Instead of just having an address that corresponds to a public key that can be verified by a signature that is added to the transaction, we have more general addresses, not based on public keys or the hashes of public keys, but instead contain arbitrary logic which decides under which conditions a particular UTxO can be spent by a particular transaction.


