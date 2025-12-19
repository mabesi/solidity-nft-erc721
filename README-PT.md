# Solidity NFT ERC721

**[🇺🇸 Read in English](README.md)**

> Uma implementação simples e educacional de um contrato inteligente de NFT seguindo o padrão ERC721 em Solidity.

## :speech_balloon: Descrição

Este projeto demonstra uma implementação completa do padrão ERC721 de Token Não-Fungível (NFT) em Solidity. Inclui a funcionalidade principal do ERC721 juntamente com as extensões Metadata e Enumerable, fornecendo um exemplo abrangente para desenvolvedores que estão aprendendo sobre desenvolvimento de contratos inteligentes de NFT.

O contrato `BasicNFT` implementa todas as interfaces necessárias e inclui recursos adicionais como cunhagem (mint), queima (burn) e mecanismos de transferência segura, tornando-o uma base sólida para entender como os NFTs funcionam na blockchain Ethereum.

## Índice

- [Funcionalidades](#funcionalidades)
- [Construído Com](#construído-com)
- [Começando](#começando)
  - [Pré-requisitos](#pré-requisitos)
  - [Implantação](#implantação)
  - [Uso](#uso)
- [Detalhes do Contrato Inteligente](#detalhes-do-contrato-inteligente)
  - [Informações do Contrato](#informações-do-contrato)
  - [Funções Principais](#funções-principais)
  - [Interfaces Suportadas](#interfaces-suportadas)
- [Informações Adicionais](#informações-adicionais)
  - [Agradecimentos](#agradecimentos)
  - [Contribuindo](#contribuindo)
  - [Autores e Colaboradores](#autores-e-colaboradores)
  - [Aviso Legal](#aviso-legal)
  - [Licença](#licença)

## Funcionalidades

- **Conformidade Total com o Padrão ERC721**: Implementa todas as funções necessárias da especificação ERC721
- **Extensão de Metadata**: Suporta `name()`, `symbol()` e `tokenURI()` para informações ricas do token
- **Extensão Enumerable**: Fornece `totalSupply()`, `tokenByIndex()` e `tokenOfOwnerByIndex()` para descoberta e iteração de tokens
- **Funcionalidade de Cunhagem (Mint)**: Permite que usuários cunhem novos NFTs com URIs de token geradas automaticamente
- **Funcionalidade de Queima (Burn)**: Permite que proprietários de tokens queimem (destruam) seus NFTs
- **Mecanismos de Transferência Segura**: Implementa `safeTransferFrom()` para prevenir perda acidental de tokens
- **Sistema de Aprovação**: Sistema completo de aprovação e gerenciamento de operadores para transferências delegadas
- **Detecção de Interface ERC165**: Suporta detecção de interface para verificações de compatibilidade

## Construído Com

- [Solidity](https://soliditylang.org/) ^0.8.17 - Linguagem de programação de contratos inteligentes
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts) - Biblioteca utilitária Strings
- [Padrão ERC721](https://eips.ethereum.org/EIPS/eip-721) - Padrão de Token Não-Fungível

## Começando

### Pré-requisitos

Para implantar e interagir com este contrato inteligente, você precisará de:

- **Remix IDE** (recomendado para iniciantes) - [https://remix.ethereum.org/](https://remix.ethereum.org/)
- **OU** um ambiente de desenvolvimento local:
  - [Node.js](https://nodejs.org/) (versão LTS)
  - [Hardhat](https://hardhat.org/) ou [Truffle](https://trufflesuite.com/)
- **MetaMask** ou outra carteira Web3 para implantação e interação
- **ETH de teste** para implantação em testnets (Sepolia, Goerli, etc.)

### Implantação

#### Usando Remix IDE (Método Mais Fácil)

1. Abra o [Remix IDE](https://remix.ethereum.org/)
2. Crie um novo arquivo chamado `BasicNFT.sol`
3. Copie e cole o código do contrato deste repositório
4. Compile o contrato:
   - Selecione a versão do compilador Solidity `0.8.17` ou superior
   - Clique em "Compile BasicNFT.sol"
5. Implante o contrato:
   - Vá para a aba "Deploy & Run Transactions"
   - Selecione "Injected Provider - MetaMask" como ambiente
   - Conecte sua carteira MetaMask
   - Clique em "Deploy"
   - Confirme a transação no MetaMask

#### Usando Hardhat

```bash
# Clone o repositório
git clone https://github.com/mabesi/solidity-nft-erc721.git
cd solidity-nft-erc721

# Instale as dependências (se você configurar um projeto Hardhat)
npm install

# Implante usando Hardhat (requer configuração do hardhat.config.js)
npx hardhat run scripts/deploy.js --network <nome-da-rede>
```

### Uso

Após a implantação, você pode interagir com o contrato usando Remix, Hardhat ou bibliotecas web3:

#### Cunhando um NFT

```solidity
// Chame a função mint()
// Isso criará um novo NFT e o atribuirá ao msg.sender
mint()
```

#### Verificando Saldo

```solidity
// Verifique quantos NFTs um endereço possui
balanceOf(address _owner)
```

#### Obtendo o Proprietário do Token

```solidity
// Descubra quem possui um token específico
ownerOf(uint256 _tokenId)
```

#### Transferindo um NFT

```solidity
// Transfira um NFT de um endereço para outro
transferFrom(address _from, address _to, uint256 _tokenId)

// Ou use transferência segura (recomendado)
safeTransferFrom(address _from, address _to, uint256 _tokenId)
```

#### Queimando um NFT

```solidity
// Destrua um NFT (apenas o proprietário ou endereço aprovado pode queimar)
burn(uint256 _tokenId)
```

#### Obtendo URI do Token

```solidity
// Obtenha a URI de metadata para um token
tokenURI(uint256 _tokenId)
// Retorna: "https://mycollection.com/nft/{tokenId}/metadata"
```

## Detalhes do Contrato Inteligente

### Informações do Contrato

- **Nome do Contrato**: BasicNFT
- **Nome da Coleção**: Mabesi Collection
- **Símbolo**: MBSCOL
- **Padrão de URI do Token**: `https://mycollection.com/nft/{tokenId}/metadata`
- **Versão Solidity**: ^0.8.17

### Funções Principais

| Função | Descrição | Acesso |
|--------|-----------|--------|
| `mint()` | Cunha um novo NFT para msg.sender | Público |
| `burn(uint256 _tokenId)` | Queima (destrói) um NFT | Proprietário/Aprovado |
| `balanceOf(address _owner)` | Obtém o saldo de NFTs de um endereço | View |
| `ownerOf(uint256 _tokenId)` | Obtém o proprietário de um token específico | View |
| `transferFrom(address _from, address _to, uint256 _tokenId)` | Transfere a propriedade do NFT | Proprietário/Aprovado |
| `safeTransferFrom(...)` | Transfere NFT com segurança com verificação do receptor | Proprietário/Aprovado |
| `approve(address _approved, uint256 _tokenId)` | Aprova endereço para transferir token | Proprietário/Operador |
| `setApprovalForAll(address _operator, bool _approved)` | Define operador para todos os tokens | Proprietário |
| `tokenURI(uint256 _tokenId)` | Obtém URI de metadata para token | View |
| `totalSupply()` | Obtém o número total de tokens | View |
| `tokenByIndex(uint256 _index)` | Obtém ID do token por índice global | View |
| `tokenOfOwnerByIndex(address _owner, uint256 _index)` | Obtém ID do token por índice do proprietário | View |

### Interfaces Suportadas

O contrato implementa e suporta as seguintes interfaces:

- `ERC165` - Detecção de interface
- `ERC721` - Funcionalidade principal de NFT
- `ERC721Metadata` - Nome, símbolo e URI do token
- `ERC721Enumerable` - Enumeração e descoberta de tokens

## Informações Adicionais

### Agradecimentos

- [OpenZeppelin](https://openzeppelin.com/) pela biblioteca utilitária Strings
- [Ethereum Foundation](https://ethereum.org/) pela especificação do padrão ERC721
- A comunidade Solidity e Web3 pelos recursos educacionais

### Contribuindo

Contribuições são bem-vindas! Se você gostaria de melhorar este exemplo educacional:

1. Faça um fork!
2. Crie sua branch de feature: `git checkout -b minha-nova-feature`
3. Adicione suas alterações: `git add .`
4. Commit suas alterações: `git commit -am 'Adiciona alguma feature'`
5. Push para a branch: `git push origin minha-nova-feature`
6. Submeta um pull request :sunglasses:

### Autores e Colaboradores

| [<img loading="lazy" src="https://github.com/mabesi.png" width=115><br><sub>Plinio Mabesi</sub>](https://github.com/mabesi) |
| :---: |

### Aviso Legal

<p align="justify">O uso desta ferramenta, para qualquer finalidade, ocorrerá por sua conta e risco, sendo de sua exclusiva responsabilidade quaisquer implicações legais decorrentes.</p>
<p align="justify">É também de responsabilidade do usuário final conhecer e obedecer todas as leis locais, estaduais e federais aplicáveis. Os desenvolvedores não assumem qualquer responsabilidade e não são responsáveis por qualquer uso indevido ou dano causado por este programa.</p>

### Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE).
