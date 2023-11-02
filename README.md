# NFT Marketplace

Welcome to the NFT Marketplace! This is a simple NFT platform where users can interact with a smart contract to buy and sell NFTs. Users have the ability to mint their NFTs by uploading images or music directly to the platform.

## Technologies Used

- [Hardhat](https://hardhat.org/): Ethereum development environment for building and testing smart contracts.

## Getting Started

Follow these steps to get the project up and running on your local machine:

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/Bryanmankind/nft-marketplace.git
   ```

2. Change to the project directory:

   ```bash
   cd nft-marketplace
   ```

3. Install the project dependencies:

   ```bash
   npm install
   ```

4. Compile the smart contracts:

   ```bash
   npx hardhat compile
   ```

5. Run a local Ethereum node for development:

   ```bash
   npx hardhat node
   ```

6. Deploy the smart contract to the local network:

   ```bash
   npx hardhat run scripts/deploy.js --network localhost
   ```

7. Start the development server:

   ```bash
   npm start
   ```

8. Access the application in your web browser at [http://localhost:3000](http://localhost:3000).

## Usage

- To mint and list your NFTs, simply upload your images or music files using the platform.
- Users can browse and purchase NFTs from the marketplace.

## Contributing

We welcome contributions to the project. If you would like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with clear messages.
4. Push your changes to your fork.
5. Submit a pull request to the main repository.

