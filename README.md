# soline  • [![tests](https://github.com/abigger87/soline/actions/workflows/tests.yml/badge.svg)](https://github.com/abigger87/soline/actions/workflows/tests.yml) [![lints](https://github.com/abigger87/soline/actions/workflows/lints.yml/badge.svg)](https://github.com/abigger87/soline/actions/workflows/lints.yml) ![GitHub](https://img.shields.io/github/license/abigger87/soline) ![GitHub package.json version](https://img.shields.io/github/package-json/v/abigger87/soline)

**Load**, **Write**, **Deploy** Solidity in the Context of a Smart Contract.

## Blueprint

```ml
lib
├─ ds-test
├─ solmate
src
├─ tests
│  ├─ utils
│  │  └─ DSTestPlus — "Custom, Extended DSTest Suite"
│  ├─ Starter.t — "Starter Contract Tests"
│  └─ Proxy.t — "Proxy Tests"
├─ Starter — "A Minimal Starter Contract"
└─ Proxy — "A Proxy Contract to Orchestrate Deployment"
```

## Development

### First time with Forge/Foundry?

Don't have [rust](https://www.rust-lang.org/tools/install) installed?
Run
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Then, install [foundry](https://github.com/gakonst/foundry) with:
```bash
cargo install --git https://github.com/gakonst/foundry --bin forge --locked
```

### Dependencies

```bash
yarn setup
```

### Run Tests

```bash
yarn test
```

## License

[AGPL-3.0-only](https://github.com/nascentxyz/yobot/blob/master/LICENSE)

# Acknowledgements

- [evm.codes](https://evm.codes)
- [foundry](https://github.com/gakonst/foundry)
- [solmate](https://github.com/Rari-Capital/solmate)
- [Georgios Konstantopoulos](https://github.com/gakonst) for [forge-template](https://github.com/gakonst/forge-template) resource.


## Disclaimer

_These smart contracts are being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of the user interface or the smart contracts. They have not been audited and as such there can be no assurance they will work as intended, and users may experience delays, failures, errors, omissions, loss of transmitted information or loss of funds. Nascent is not liable for any of the foregoing. Users should proceed with caution and use at their own risk._
