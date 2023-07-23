//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol";

interface ERC165 {
    /// @notice Query if a contract implements an interface
    /// @param interfaceID The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    ///  uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    ///  `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

/// @title ERC-721 Non-Fungible Token Standard
/// @dev See https://eips.ethereum.org/EIPS/eip-721
///  Note: the ERC-165 identifier for this interface is 0x80ac58cd.
interface ERC721 is ERC165 {
    /// @dev This emits when ownership of any NFT changes by any mechanism.
    ///  This event emits when NFTs are created (`from` == 0) and destroyed
    ///  (`to` == 0). Exception: during contract creation, any number of NFTs
    ///  may be created and assigned without emitting Transfer. At the time of
    ///  any transfer, the approved address for that NFT (if any) is reset to none.
    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);

    /// @dev This emits when the approved address for an NFT is changed or
    ///  reaffirmed. The zero address indicates there is no approved address.
    ///  When a Transfer event emits, this also indicates that the approved
    ///  address for that NFT (if any) is reset to none.
    event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);

    /// @dev This emits when an operator is enabled or disabled for an owner.
    ///  The operator can manage all NFTs of the owner.
    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);

    /// @notice Count all NFTs assigned to an owner
    /// @dev NFTs assigned to the zero address are considered invalid, and this
    ///  function throws for queries about the zero address.
    /// @param _owner An address for whom to query the balance
    /// @return The number of NFTs owned by `_owner`, possibly zero
    function balanceOf(address _owner) external view returns (uint256);

    /// @notice Find the owner of an NFT
    /// @dev NFTs assigned to zero address are considered invalid, and queries
    ///  about them do throw.
    /// @param _tokenId The identifier for an NFT
    /// @return The address of the owner of the NFT
    function ownerOf(uint256 _tokenId) external view returns (address);

    /// @notice Transfers the ownership of an NFT from one address to another address
    /// @dev Throws unless `msg.sender` is the current owner, an authorized
    ///  operator, or the approved address for this NFT. Throws if `_from` is
    ///  not the current owner. Throws if `_to` is the zero address. Throws if
    ///  `_tokenId` is not a valid NFT. When transfer is complete, this function
    ///  checks if `_to` is a smart contract (code size > 0). If so, it calls
    ///  `onERC721Received` on `_to` and throws if the return value is not
    ///  `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`.
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    /// @param data Additional data with no specified format, sent in call to `_to`
    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes calldata data) external payable;

    /// @notice Transfers the ownership of an NFT from one address to another address
    /// @dev This works identically to the other function with an extra data parameter,
    ///  except this function just sets data to "".
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable;

    /// @notice Transfer ownership of an NFT -- THE CALLER IS RESPONSIBLE
    ///  TO CONFIRM THAT `_to` IS CAPABLE OF RECEIVING NFTS OR ELSE
    ///  THEY MAY BE PERMANENTLY LOST
    /// @dev Throws unless `msg.sender` is the current owner, an authorized
    ///  operator, or the approved address for this NFT. Throws if `_from` is
    ///  not the current owner. Throws if `_to` is the zero address. Throws if
    ///  `_tokenId` is not a valid NFT.
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    function transferFrom(address _from, address _to, uint256 _tokenId) external payable;

    /// @notice Change or reaffirm the approved address for an NFT
    /// @dev The zero address indicates there is no approved address.
    ///  Throws unless `msg.sender` is the current NFT owner, or an authorized
    ///  operator of the current owner.
    /// @param _approved The new approved NFT controller
    /// @param _tokenId The NFT to approve
    function approve(address _approved, uint256 _tokenId) external payable;

    /// @notice Enable or disable approval for a third party ("operator") to manage
    ///  all of `msg.sender`'s assets
    /// @dev Emits the ApprovalForAll event. The contract MUST allow
    ///  multiple operators per owner.
    /// @param _operator Address to add to the set of authorized operators
    /// @param _approved True if the operator is approved, false to revoke approval
    function setApprovalForAll(address _operator, bool _approved) external;

    /// @notice Get the approved address for a single NFT
    /// @dev Throws if `_tokenId` is not a valid NFT.
    /// @param _tokenId The NFT to find the approved address for
    /// @return The approved address for this NFT, or the zero address if there is none
    function getApproved(uint256 _tokenId) external view returns (address);

    /// @notice Query if an address is an authorized operator for another address
    /// @param _owner The address that owns the NFTs
    /// @param _operator The address that acts on behalf of the owner
    /// @return True if `_operator` is an approved operator for `_owner`, false otherwise
    function isApprovedForAll(address _owner, address _operator) external view returns (bool);
}

interface ERC721TokenReceiver {
    /// @notice Handle the receipt of an NFT
    /// @dev The ERC721 smart contract calls this function on the recipient
    ///  after a `transfer`. This function MAY throw to revert and reject the
    ///  transfer. Return of other than the magic value MUST result in the
    ///  transaction being reverted.
    ///  Note: the contract address is always the message sender.
    /// @param _operator The address which called `safeTransferFrom` function
    /// @param _from The address which previously owned the token
    /// @param _tokenId The NFT identifier which is being transferred
    /// @param _data Additional data with no specified format
    /// @return `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`
    ///  unless throwing
    function onERC721Received(address _operator, address _from, uint256 _tokenId, bytes calldata _data) external returns(bytes4);
}

/// @title ERC-721 Non-Fungible Token Standard, optional metadata extension
/// @dev See https://eips.ethereum.org/EIPS/eip-721
///  Note: the ERC-165 identifier for this interface is 0x5b5e139f.
interface ERC721Metadata is ERC721 {
    /// @notice A descriptive name for a collection of NFTs in this contract
    function name() external view returns (string memory _name);

    /// @notice An abbreviated name for NFTs in this contract
    function symbol() external view returns (string memory _symbol);

    /// @notice A distinct Uniform Resource Identifier (URI) for a given asset.
    /// @dev Throws if `_tokenId` is not a valid NFT. URIs are defined in RFC
    ///  3986. The URI may point to a JSON file that conforms to the "ERC721
    ///  Metadata JSON Schema".
    function tokenURI(uint256 _tokenId) external view returns (string memory);
}

/// @title ERC-721 Non-Fungible Token Standard, optional enumeration extension
/// @dev See https://eips.ethereum.org/EIPS/eip-721
///  Note: the ERC-165 identifier for this interface is 0x780e9d63.
interface ERC721Enumerable is ERC721Metadata {
    /// @notice Count NFTs tracked by this contract
    /// @return A count of valid NFTs tracked by this contract, where each one of
    ///  them has an assigned and queryable owner not equal to the zero address
    function totalSupply() external view returns (uint256);

    /// @notice Enumerate valid NFTs
    /// @dev Throws if `_index` >= `totalSupply()`.
    /// @param _index A counter less than `totalSupply()`
    /// @return The token identifier for the `_index`th NFT,
    ///  (sort order not specified)
    function tokenByIndex(uint256 _index) external view returns (uint256);

    /// @notice Enumerate NFTs assigned to an owner
    /// @dev Throws if `_index` >= `balanceOf(_owner)` or if
    ///  `_owner` is the zero address, representing invalid NFTs.
    /// @param _owner An address where we are interested in NFTs owned by them
    /// @param _index A counter less than `balanceOf(_owner)`
    /// @return The token identifier for the `_index`th NFT assigned to `_owner`,
    ///   (sort order not specified)
    function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns (uint256);
}

contract BasicNFT is ERC721Enumerable {

    // EVENTS -----------------------------------------------------------
    //
    // Transfer()
    // Approval()
    // ApprovalForAll()
    //
    // Events do not need to be implemented as they are inherited directly from the interface

    // VARIABLES  --------------------------------------------------------

    mapping(address => uint256) internal _balanceOf; // owner => balance
    mapping(uint256 => address) internal _ownerOf; // tokenId => owner
    mapping(uint256 => address) internal _approvals; // tokenId => approved operator/controller
    mapping(address => mapping(address => bool)) public isApprovedForAll; //owner => (operator => true/false)

    // Minted IDs
    uint256 internal _lastId;

    // URI Metadata
    mapping (uint256 => string) internal _uris; // tokenId => URI

    // Enumerable
    uint256[] internal _allTokens; // All tokens created
    mapping(uint256 => uint256) internal _allTokensIndex; // tokenId => global index
    mapping(address => mapping(uint256 => uint256)) internal _ownedTokens; // owner => (index => tokenId)
    mapping(uint256 => uint256) internal _ownedTokensIndex; // tokenId => owner index

    // METHODS -----------------------------------------------------------

    // constructor() {
    //     any code;
    // }

    function mint() public {
        _lastId++;
        _ownerOf[_lastId] = msg.sender;
        _balanceOf[msg.sender]++;

        _uris[_lastId] = string.concat(
            "https://mycollection.com/nft/",
            Strings.toString(_lastId),
            "/metadata"
        );

        _allTokens.push(_lastId);
        _allTokensIndex[_lastId] = _allTokens.length - 1;

        _ownedTokens[msg.sender][_balanceOf[msg.sender] - 1] = _lastId;
        _ownedTokensIndex[_lastId] = _balanceOf[msg.sender] - 1;

        emit Transfer(address(0), msg.sender, _lastId);
    }

    function burn(uint256 _tokenId) public {
        
        address _owner = _ownerOf[_tokenId];
        
        require(_owner != address(0), "Token does not exists");
        require(_isApprovedOrOwner(msg.sender,_tokenId), "You do not have permission");
                
        _balanceOf[_owner]--;
        _ownerOf[_tokenId] = address(0);
        delete _uris[_tokenId];
        delete _approvals[_tokenId];

        uint256 _removedIndex = _allTokensIndex[_tokenId];
        _allTokens[_removedIndex] = _allTokensIndex[_allTokens.length - 1];
        _allTokens.pop();
        delete _allTokensIndex[_tokenId];

        uint256 _removedOwnedIndex = _ownedTokensIndex[_tokenId];
        _ownedTokens[msg.sender][_removedOwnedIndex] = _ownedTokens[msg.sender][_balanceOf[msg.sender]];
        delete _ownedTokens[msg.sender][_balanceOf[msg.sender]];
        delete _ownedTokensIndex[_tokenId];

        emit Transfer(_owner, address(0), _tokenId);
        emit Approval(_owner, address(0), _tokenId);
    }

    function balanceOf(address _owner) external view returns (uint256) {
        require(_owner != address(0), "Invalid address");
        return _balanceOf[_owner];
    }

    function ownerOf(uint256 _tokenId) external view returns (address) {
        address owner = _ownerOf[_tokenId];
        require(owner != address(0), "The token does not exists");
        return owner;
    }

    function _transferFrom(address _from, address _to, uint256 _tokenId) internal {
        require(_from == _ownerOf[_tokenId], "The sender must be the token owner");
        require(_to != address(0), "The receiver must be different of zero");
        require(_isApprovedOrOwner(msg.sender,_tokenId), "You do not have permission");
        
        _balanceOf[_from]--;
        _balanceOf[_to]++;
        _ownerOf[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
        
        delete _approvals[_tokenId];
        emit Approval(_from, address(0), _tokenId);
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) external payable {
        _transferFrom(_from, _to, _tokenId);
    }

    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable {

        _transferFrom(_from, _to, _tokenId);

        require(_to.code.length == 0 ||
                ERC721TokenReceiver(_to).onERC721Received(msg.sender, _from, _tokenId, "")
                    == ERC721TokenReceiver.onERC721Received.selector,
                "Unsafe recipient");
    }

    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes calldata data) external payable {
        _transferFrom(_from, _to, _tokenId);
        require(_to.code.length == 0 ||
                ERC721TokenReceiver(_to).onERC721Received(msg.sender, _from, _tokenId, data)
                    == ERC721TokenReceiver.onERC721Received.selector,
                "Unsafe recipient");
    }

    function _isApprovedOrOwner(address _spender, uint256 _tokenId) internal view returns (bool) {
        return _spender == _ownerOf[_tokenId]
                || _spender == _approvals[_tokenId]
                || isApprovedForAll[_ownerOf[_tokenId]][_spender];
    }

    function approve(address _approved, uint256 _tokenId) external payable {
        require(_isApprovedOrOwner(msg.sender, _tokenId), "Not authorized");
        _approvals[_tokenId] = _approved;
        emit Approval(_ownerOf[_tokenId], _approved, _tokenId);
    }

    function getApproved(uint256 _tokenId) external view returns (address) {
        require(_ownerOf[_tokenId] != address(0), "Token does not exists");
        return _approvals[_tokenId];
    }

    function setApprovalForAll(address _operator, bool _approved) external {
        isApprovedForAll[msg.sender][_operator] = _approved;
        emit ApprovalForAll(msg.sender, _operator, _approved);
    }

    // Interface ID
    function supportsInterface(bytes4 interfaceID) external pure returns (bool) {
        return interfaceID == type(ERC721).interfaceId
                || interfaceID == type(ERC165).interfaceId
                || interfaceID == type(ERC721Metadata).interfaceId
                || interfaceID == type(ERC721Enumerable).interfaceId;
    }

    // Metadata
    function name() external pure returns (string memory _name) {
        return "Mabesi Collection";
    }

    function symbol() external pure returns (string memory _symbol) {
        return "MBSCOL";
    }

    function tokenURI(uint256 _tokenId) external view returns (string memory) {
        require(_ownerOf[_tokenId] != address(0), "Token does not exists");
        return _uris[_tokenId];
    }

    // Enumerable
    function totalSupply() external view returns (uint256) {
        return _allTokens.length;
    }

    function tokenByIndex(uint256 _index) external view returns (uint256) {
        require(_index < _allTokens.length, "Index out of bounds");
        return _allTokens[_index];
    }

    function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns (uint256) {
        require(_index < _balanceOf[_owner], "Index out of bounds");
        return _ownedTokens[_owner][_index];
    }

}
