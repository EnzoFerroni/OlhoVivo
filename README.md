<div align="center">

# Olho Vivo

### Acompanhe as linhas de ônibus de São Paulo em tempo real.

Pesquise uma linha, selecione-a e veja os pontos e os ônibus em operação
direto no mapa — em um app nativo em SwiftUI.

<br/>

[![Platform](https://img.shields.io/badge/iOS-26.5+-000000?style=for-the-badge&logo=apple&logoColor=white)](https://www.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5-FA7343?style=for-the-badge&logo=swift&logoColor=white)](https://swift.org)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-0080FF?style=for-the-badge&logo=swift&logoColor=white)](https://developer.apple.com/xcode/swiftui/)
[![License](https://img.shields.io/badge/License-MIT-3DA639?style=for-the-badge)](LICENSE)

</div>

---

## Sumário

- [Sobre](#sobre)
- [Funcionalidades](#funcionalidades)
- [Como funciona](#como-funciona)
- [Tecnologias](#tecnologias)
- [Estrutura do projeto](#estrutura-do-projeto)
- [Como rodar](#como-rodar)
- [Autor](#autor)
- [Licença](#licença)

---

## Sobre

**Olho Vivo** é um app iOS em **SwiftUI** que consome a
[API Olho Vivo](https://www.sptrans.com.br/desenvolvedores/) da SPTrans para
mostrar, em tempo real, as linhas de ônibus da cidade de São Paulo.

---

## Funcionalidades

- Busca de linhas por número ou destino
- Pontos no mapa da linha selecionada
- Ônibus em operação posicionados em tempo real
- Identificador de linha colorido pela zona

---

## Como funciona

1. O usuário pesquisa uma linha na barra de busca.
2. Ao selecionar uma linha, o app busca seus pontos e veículos.
3. Pontos e ônibus aparecem como marcadores no mapa.

---

## Tecnologias

- **SwiftUI** e **MapKit**
- **async/await** para a camada de rede
- Arquitetura **MVVM**
- **API Olho Vivo** (SPTrans)

---

## Estrutura do projeto

```
OlhoVivo/OlhoVivo/
├── Models/          BusLine, BusStop, Vehicle, Zone
├── Services/        OlhoVivoService
├── ViewModels/      MapViewModel
└── Views/           MapView, SheetView, Components
```

---

## Como rodar

```bash
git clone https://github.com/EnzoFerroni/OlhoVivo.git
cd OlhoVivo
open OlhoVivo/OlhoVivo.xcodeproj
```

A chave da API não é versionada. Para rodar o projeto:

1. Pegue um token em [sptrans.com.br/desenvolvedores](https://www.sptrans.com.br/desenvolvedores/).
2. Crie o arquivo `OlhoVivo/Secrets.xcconfig`:

   ```
   API = sua_chave_aqui
   ```

3. Rode com `⌘R`.

---

## Autor

**Enzo Ferroni** — [GitHub](https://github.com/EnzoFerroni)

---

## Licença

Distribuído sob a licença MIT. Veja [LICENSE](LICENSE).
