// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract nftMarketPlace is ERC721URIStorage {

    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;

    Counters.Counter private _itemSold;

    address private owner;

    uint256 listingPrice = 0.1 ether;

    struct nftData {
        uint256 _tokenId;
        address payable _owner;
        address payable _seller;
        uint256 _nftprice;
        bool _nftListed;
    }

    event nftListed (
        uint256 indexed _tokenId,
        address payable owner,
        address payable seller,
        uint256 _nftPrice,
        bool _nftListed
    );

    mapping(uint256 => nftData) private _idTonftData;

    constructor () ERC721 ("BriTechMarket", "BTM") {
        owner = payable(msg.sender);
    } 

    function upDateListPrice(uint256 _newPrice) public {
        require (owner == msg.sender, "Only owner can call this function");
        listingPrice = _newPrice;
    }

    function getListingPrice () public view returns (uint256) {
        return listingPrice;
    }

    function getListedidTonftData () public view returns (nftData memory) {
        uint256 currentToken =  _tokenIds.current();
        return _idTonftData[currentToken];
    }

    function getListedIdnft(uint256 tokenId) public view returns (nftData memory) {
        return _idTonftData[tokenId];
    }

    function getCurrentToken() public view returns (uint256) {
        return _tokenIds.current();
    }

    function listNft (string memory _nftURI, uint256 _nftPrice) public payable returns (uint) {
        _tokenIds.increment();

        uint256 newNft =  _tokenIds.current();
        require(msg.sender != address(0), "Invalid address");
        _safeMint(msg.sender, newNft);

        _setTokenURI(newNft, _nftURI);
        
        createListedTokens(newNft, _nftPrice);

        return newNft;
    }

    function createListedTokens (uint256 tokenId, uint256  _nftPrice) private {
        require (msg.value == listingPrice, "insuficient balance");

        require (_nftPrice > 0, "invalid price amount");

        _idTonftData[tokenId] = nftData (
        tokenId,
        payable (address(this)),
        payable (msg.sender),
        _nftPrice,
        true
        );

        _transfer(msg.sender, payable(address(this)), tokenId);

        emit nftListed (
        tokenId,
        payable(address(this)),
        payable(address(msg.sender)),
        _nftPrice,
        true
        );
    }

    function GetListedNft () public view returns (nftData[] memory) {
        uint256 listedNft = _tokenIds.current();
        nftData[] memory tokens = new nftData[](listedNft);

        uint currentIndex = 0;
        uint currentId;

        for(uint i = 0; i < listedNft; i++) {
            currentId = i + 1;
            nftData storage currentItems =  _idTonftData[currentId];
            tokens[currentIndex] = currentItems;
            currentIndex += 1;
        }

        return tokens;
    }

    // Returns all the NFTs that the current user is owner or seller in

    function UserNft () public view returns (nftData[] memory) {
        uint userNft = _tokenIds.current();
        nftData[] memory listUserNft = new nftData[](userNft);

        uint itemCount = 0;
        uint userNftIndex = 0;
        uint userNftCurrentId;

        for (uint i = 0; i < userNft; i++) {
            if (_idTonftData[i+1]._owner == msg.sender || _idTonftData[i+1]._seller == msg.sender ) 
            itemCount += 1;
        }

        for (uint i = 0; i < userNft; i++) {
            if (_idTonftData[i+1]._owner == msg.sender || _idTonftData[i+1]._seller == msg.sender){
                userNftCurrentId ++;
                
                nftData storage nftItems = _idTonftData[userNftCurrentId];
                listUserNft[userNftIndex] = nftItems;
                userNftCurrentId ++;
            }
        }
        return listUserNft;
    }

    function executeSale (uint256 _tokenId) public payable {
        uint price =  _idTonftData[_tokenId]._nftprice;
        address seller =  _idTonftData[_tokenId]._seller;

        require (msg.value == price, "insurficient token amount" );

        _idTonftData[_tokenId]._nftListed =  true;
        _idTonftData[_tokenId]._seller =  payable (msg.sender);

        _itemSold.increment();

        _transfer(address(this), msg.sender, _tokenId);

        approve(address(this), _tokenId);

        payable(owner).transfer(listingPrice);

        payable(seller).transfer(msg.value);

    }
}