# BitFutures: Decentralized Bitcoin Price Prediction Market

BitFutures is a decentralized prediction market platform built on the Stacks blockchain that enables users to stake STX tokens on Bitcoin price movements. The platform provides a transparent, trustless environment for price speculation while ensuring fair market operations and user fund security.

## Overview

BitFutures allows users to participate in binary prediction markets focused on Bitcoin price movements. Users can stake STX tokens on whether they believe the BTC price will increase or decrease within a specified timeframe. Winners share the total pool proportionally to their stake, with a small platform fee deducted.

## Features

- **Binary Markets**: Simple up/down predictions on BTC price movements
- **Proportional Rewards**: Winners share the pool based on their stake size
- **Oracle Integration**: Reliable price data from trusted oracle
- **Automated Lifecycle**: Fully automated market creation, resolution, and reward distribution
- **Configurable Parameters**: Adjustable minimum stakes and platform fees
- **Security First**: Built-in safeguards for market integrity and fund protection

## Smart Contract Details

### Core Functions

#### Creating Markets

```clarity
(create-market (start-price uint) (start-block uint) (end-block uint))
```

- Creates a new prediction market
- Only callable by contract owner
- Parameters:
  - `start-price`: Initial BTC price at market creation
  - `start-block`: Block height when market opens
  - `end-block`: Block height when market closes

#### Making Predictions

```clarity
(make-prediction (market-id uint) (prediction (string-ascii 4)) (stake uint))
```

- Places a prediction in an active market
- Parameters:
  - `market-id`: Unique identifier of the market
  - `prediction`: Either "up" or "down"
  - `stake`: Amount of STX to stake (must meet minimum requirement)

#### Resolving Markets

```clarity
(resolve-market (market-id uint) (end-price uint))
```

- Finalizes a market with the end price
- Only callable by the oracle
- Parameters:
  - `market-id`: Market to resolve
  - `end-price`: Final BTC price at market end

#### Claiming Winnings

```clarity
(claim-winnings (market-id uint))
```

- Claims rewards from a resolved market
- Only winners can claim
- Automatically calculates and distributes rewards

### Administrative Functions

#### Oracle Management

```clarity
(set-oracle-address (new-address principal))
```

- Updates the oracle address
- Only callable by contract owner

#### Platform Parameters

```clarity
(set-minimum-stake (new-minimum uint))
(set-fee-percentage (new-fee uint))
```

- Adjusts minimum stake requirement and platform fee
- Only callable by contract owner
- Fee percentage must be between 0-100

#### Fee Management

```clarity
(withdraw-fees (amount uint))
```

- Withdraws accumulated platform fees
- Only callable by contract owner

### Read-Only Functions

```clarity
(get-market (market-id uint))
(get-user-prediction (market-id uint) (user principal))
(get-contract-balance)
```

- Query market details, user predictions, and contract balance
- No state modifications
- Available to all users

## Error Codes

| Code | Description                             |
| ---- | --------------------------------------- |
| u100 | Owner-only function called by non-owner |
| u101 | Market or prediction not found          |
| u102 | Invalid prediction format               |
| u103 | Market is closed                        |
| u104 | Winnings already claimed                |
| u105 | Insufficient balance                    |
| u106 | Invalid parameter value                 |
| u107 | Market not started                      |
| u108 | Market ended                            |
| u109 | Market already resolved                 |

## Security Considerations

1. **Market Integrity**

   - Markets can only be created by the contract owner
   - Oracle-based price resolution prevents manipulation
   - Minimum stake requirement prevents spam

2. **Fund Safety**

   - Automatic reward distribution
   - Protected withdrawal mechanisms
   - Balance checks before transfers

3. **Access Control**
   - Clear separation of user and admin functions
   - Oracle authentication for price resolution
   - Owner-only administrative functions

## Platform Economics

- Minimum stake: 1 STX
- Platform fee: 2% of winning pool
- Proportional reward distribution
- Automated fee collection and distribution

## Usage Example

1. Contract owner creates a new market:

```clarity
(create-market u47000 u100 u200)
```

2. Users make predictions:

```clarity
(make-prediction u1 "up" u1000000)
```

3. Oracle resolves the market:

```clarity
(resolve-market u1 u48000)
```

4. Winners claim rewards:

```clarity
(claim-winnings u1)
```

## Best Practices

1. **For Users**

   - Verify market parameters before participating
   - Ensure sufficient STX balance for stakes
   - Check market status before claiming rewards

2. **For Administrators**
   - Regular oracle address verification
   - Careful parameter adjustment
   - Monitoring of platform metrics

## Technical Requirements

- Stacks blockchain compatibility
- STX token for staking
- Principal for contract deployment
- Oracle integration capability

## Future Enhancements

Potential improvements for future versions:

- Multiple price oracles for redundancy
- Advanced market types (range predictions)
- Dynamic fee adjustment based on market size
- Integration with DeFi protocols
- Enhanced reward distribution mechanisms
