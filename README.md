# Olho Vivo

[![iOS](https://img.shields.io/badge/iOS-26.5%2B-000000?logo=apple)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5-F05138?logo=swift&logoColor=white)](https://swift.org)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-MapKit-0A84FF)](https://developer.apple.com/xcode/swiftui/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

A native SwiftUI app that tracks São Paulo bus lines in real time using the SPTrans Olho Vivo API.

## Table of Contents

- [About](#about)
- [Features](#features)
- [How It Works](#how-it-works)
- [Built With](#built-with)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Author](#author)
- [License](#license)

## About

Olho Vivo was built for an Apple Developer Academy | Mackenzie technical challenge:
turn a design handoff into a working app that consumes the
[Olho Vivo API](https://www.sptrans.com.br/desenvolvedores/), the public REST API from
São Paulo's transit authority (SPTrans). The UI is in Portuguese.

## Features

- Search bus lines by number or destination
- Show every stop of the selected line on the map
- Show buses in operation, positioned in real time
- Line badges colored by city zone

## How It Works

1. The user searches for a line in the search bar.
2. On selection, the app fetches the line's stops and vehicles.
3. Stops and buses are rendered as map annotations.

The API authenticates with a token and returns a session cookie, which `URLSession`
reuses on every following request.

## Built With

- SwiftUI and MapKit
- `async/await` networking
- MVVM (`MapViewModel`, `OlhoVivoService`)

## Getting Started

Requirements: Xcode 26 or later and a free SPTrans developer token.

```bash
git clone https://github.com/EnzoFerroni/OlhoVivo.git
cd OlhoVivo
open OlhoVivo/OlhoVivo.xcodeproj
```

The token is not versioned. To run the app:

1. Get a token at [sptrans.com.br/desenvolvedores](https://www.sptrans.com.br/desenvolvedores/).
2. Create `OlhoVivo/Secrets.xcconfig`:

   ```
   API = your_token_here
   ```

3. Press Run.

## Project Structure

```
OlhoVivo/OlhoVivo/
├── Models/       BusLine, BusStop, Vehicle, Zone
├── Services/     OlhoVivoService
├── ViewModels/   MapViewModel
└── Views/        MapView, SheetView, Components
```

## Author

<div align="center">
  <table>
    <tr>
      <td align="center" width="100%">
        <a href="https://github.com/EnzoFerroni"><img src="https://github.com/EnzoFerroni.png" width="90" alt="Enzo Ferroni"/></a>
        <br/><sub><b>Enzo Ferroni</b></sub><br/><br/>
        <a href="https://github.com/EnzoFerroni"><img src="https://skillicons.dev/icons?i=github" alt="GitHub"/></a>
        <a href="https://www.linkedin.com/in/enzoferroni/"><img src="https://skillicons.dev/icons?i=linkedin" alt="LinkedIn"/></a>
      </td>
    </tr>
  </table>
</div>

## License

Released under the [MIT License](LICENSE). Copyright (c) 2026 Enzo Ferroni.
