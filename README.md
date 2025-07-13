# WhisperNote Umi Integration Contracts

This repo contains a Move smart contract for Umi integration with WhisperNote.

## Counter Contract

A simple Move contract to increment and fetch a counter value.

- **Source:** `contracts/counter/sources/counter.move`
- **Deploy:** Use Hardhat and Aptos CLI as described in [contracts.md](../docxed/docxed/buildathonzx/whisperrnote/integrations/umi/contracts.md).

## Quick Start

1. Install dependencies:
    ```sh
    npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox @moved/hardhat-plugin @aptos-labs/ts-sdk
    ```
2. Compile contract:
    ```sh
    npx hardhat compile
    ```
3. Deploy contract:
    ```sh
    npx hardhat run scripts/deploy.js
    ```

## Usage

- Interact with the contract using Umi integration in WhisperNote (`src/integrations/umi`).
- See [contracts.md](../docxed/docxed/buildathonzx/whisperrnote/integrations/umi/contracts.md) for details.
