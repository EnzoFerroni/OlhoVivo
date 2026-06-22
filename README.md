<img src="https://www.sptrans.com.br/images/logo-sptrans.png" alt="Olho Vivo" height="48" align="right" />

# Olho Vivo

[![Platform](https://img.shields.io/badge/platform-iOS%2026.5%2B-blue.svg)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-✓-brightgreen.svg)](https://developer.apple.com/xcode/swiftui/)
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](#license)

Olho Vivo é um aplicativo iOS para acompanhar, em tempo real, as linhas de ônibus
da cidade de São Paulo. Pesquise uma linha, selecione-a e veja seus pontos e os
veículos em operação diretamente no mapa.

Os dados são fornecidos pela [API Olho Vivo](https://www.sptrans.com.br/desenvolvedores/)
da SPTrans, desenvolvida pelo Governo do Estado de São Paulo.

## Conteúdo

- [Funcionalidades](#funcionalidades)
- [Requisitos](#requisitos)
- [Começando](#começando)
  - [Chave da API](#chave-da-api)
- [Arquitetura](#arquitetura)
- [Estrutura do projeto](#estrutura-do-projeto)
- [Componentes](#componentes)
- [Créditos](#créditos)
- [Licença](#license)

## Funcionalidades

- 🔎 **Busca de linhas** por número ou destino (`Linha/Buscar`).
- 🗺️ **Pontos no mapa** da linha selecionada (`Parada/BuscarParadasPorLinha`).
- 🚌 **Veículos em operação** posicionados em tempo real (`Posicao/Linha`).
- 🎨 **Identificador de linha** colorido pela zona de origem.
- 📍 **Centralização** na localização do usuário.

## Requisitos

- iOS 26.5+
- Xcode 26.5+
- Swift 5

## Começando

```bash
git clone https://github.com/EnzoFerroni/OlhoVivo.git
cd OlhoVivo
open OlhoVivo/OlhoVivo.xcodeproj
```

### Chave da API

A chave da API **não é versionada** (está no `.gitignore`). Para rodar o projeto
você precisa criar o arquivo de configuração com a sua própria chave:

1. Solicite um token em
   [sptrans.com.br/desenvolvedores](https://www.sptrans.com.br/desenvolvedores/).
2. Crie o arquivo `OlhoVivo/Secrets.xcconfig` com o conteúdo:

   ```
   API = sua_chave_aqui
   ```

3. Compile e execute (`⌘R`).

O `Secrets.xcconfig` é referenciado como *base configuration* do target e exposto
em tempo de execução pela chave `API` do `Info.plist`, lida em
[`OlhoVivoService`](OlhoVivo/OlhoVivo/Services/OlhoVivoService.swift).

## Arquitetura

O app segue **MVVM**, mantendo as camadas isoladas e testáveis:

```
View  ──▶  ViewModel  ──▶  Service  ──▶  Olho Vivo API
(SwiftUI)  (estado)        (rede)
```

- **Models** — tipos `Codable` que mapeiam o JSON da API.
- **Services** — `OlhoVivoService`, um `actor` que autentica e consome a API.
- **ViewModels** — `MapViewModel`, estado observável da tela.
- **Views** — telas e componentes reutilizáveis em SwiftUI.

## Estrutura do projeto

```
OlhoVivo/OlhoVivo/
├── Models/          BusLine, BusStop, Vehicle, Zone
├── Services/        OlhoVivoService
├── ViewModels/      MapViewModel
└── Views/
    ├── MapView, SheetView
    └── Components/  LineCard, LineIdentifier, StopIdentifier,
                     CenterButton, EmptyLineState
```

## Componentes

| Componente | Descrição |
|------------|-----------|
| `LineIdentifier` | Badge com o identificador textual da linha, colorido pela zona. |
| `LineCard` | Linha, terminais, total de paradas e indicador de comportamento circular. |
| `StopIdentifier` | Nome e endereço de um ponto. |
| `CenterButton` | Recentraliza o mapa na localização do usuário. |
| `EmptyLineState` | Estado vazio da busca. |

O código é documentado com comentários **DocC** (`///`). Gere a documentação pelo
Xcode em **Product → Build Documentation**.

## Créditos

- Design: *Handoff – Check-In (06/2026)*.
- Dados: [API Olho Vivo – SPTrans](https://www.sptrans.com.br/desenvolvedores/).

## License

Olho Vivo é distribuído sob a licença MIT.
