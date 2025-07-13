# WhisperNote Umi Integration Contracts

This repo contains a Move smart contract for decentralized notes integration with WhisperNote.

## Notes Contract

A Move contract for creating, updating, and fetching notes per user.

- **Source:** `contracts/notes/sources/notes.move`
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
