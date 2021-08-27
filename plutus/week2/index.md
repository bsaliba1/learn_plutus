# Week 2
[<- Back to Homepage](../../index.md)

## Triggering Change
- Smart contracts will never change state unless triggered by a transaction
- In the example, the auction will not close unless triggered by a transaction

## On-chain Validation Scripts
- Key data structures:
	- Datum: at the UTXO level
	- Redemer: comes from the input
	- Context: consisting of the transaction and it's inputs and outputs
- These key data structures are all represented as the same data type in Plutus
	- Class Name: Data
	- Definition: https://github.com/input-output-hk/plutus/blob/master/plutus-core/plutus-core/src/PlutusCore/Data.hs
- Validation function signature
```
mkValidator :: Data -> Data -> Data -> ()
```

## Examples
1. Validator that always passes
```
mkValidator _ _ _ = ()
```


