# Week 1
[⬅︎ Back to Homepage](../../index.md)
## Basic UTxO
- UTxO = "Unspent Transaction Output Model"
- Pieces of a transaction:
  - Public input key address
  - Public output key address
  - Transaction amount
  - Signature
- Input amount of a transaction should equal the output amount
- If Alice has one UTxO of 100 ADA and wants to send 10 ADA to Bob then the transaction would look as such:
  - Input: (Alice) 100 ADA
  - Output: (Alice) 90 ADA, (Bob) 10 ADA
- To authenticate transactions, signatures are sent with a transaction

## (E)UTxO
- [IOHK Paper](https://api.zotero.org/groups/478201/items/T24L95MI/file/view?key=Qcjdk4erSuUZ8jvAah59Asef)
- (E)UTxO = "Extended Unspent Transaction Output Model"
- "Extended" because it adds a new type of address, **script addresses**
- Pieces of a transaction:
  - Public input script address
  - Public output key address
  - Redeemer
  - Transaction amount
  - Datum
  - Validator
- **Input script address:** Instead of using public key addresses we use Plutus scripts. This arbitrary input script has access to the complete state of the blockchain but can't see the whole transaction that is being validated.
- **Redeemer** -> Instead of signing transactions we use arbitrary logic known as a 'redeemer'
- **Datum** -> An arbitrary piece of data that is attached to an address
- **Validator** -> Checks whether or not a transaction will validate in your wallet before sending it to the chain
  - This is not the case in Ethereum which is the reason why you still have to pay gas fees for failed transactions

## Plutus
### On-Chain Code
- **Definition:** Scripts with corresponding addresses, that determine whether or not a transaction will be valid given the input
- **Language:** Haskell (compiles into Plutus Core)
- **Execution Time:** When a transaction attempts to consume the script address as input
- **Output:** Sucess or Failure. Only if the script succeeds does the transaction get validated by a node. Only if the transaction is validated does it get accepted into the mempool.

### Off-chain Code
- **Definition:** Code that constructs valid transaction. Gets executed in the wallet
- **Language:** Haskell
- **Execution Time:** When the transaction needs to be built and sent on the chain for validation.
- **Output:** Valid transaction

