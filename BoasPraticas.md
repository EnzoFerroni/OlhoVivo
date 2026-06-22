## Academy Coding Standards

Este documento estabelece um padrão de código, estilo e desenvolvimento para ser utilizado na Apple Developer Academy | Mackenzie, com o objetivo de criar uma base de código reconhecível e consistente nos projetos desenvolvidos por Jr. Learners e Sr. Learners neste ambiente.

Este guia serve como referência para boas práticas de desenvolvimento, porém seu uso é **flexível**. Cada desenvolvedor deve avaliar criticamente quais recomendações adotar de acordo com as necessidades específicas de cada projeto.

### Sumário
1. [Inspirações e Limitações](#inspirações-e-limitações)
2. [Estilo de Código](#estilo-de-código)
    1. [Convenções Simples](#convenções-simples)
    2. [Linhas](#linhas)
    3. [Recuo e Indentação](#recuo-e-indentação)
    4. [Convenções de Nomenclatura](#convenções-de-nomenclatura)
    5. [Tratamento de Optionals](#tratamento-de-optionals)
    6. [Organização de Declarações](#organização-de-declarações)
    7. [Espaçamento](#espaçamento)
    8. [Comentários](#comentários)
3. [Desenvolvimento e Versionamento](#desenvolvimento-e-versionamento)
    1. [Convenções Simples](#convenções-simples)
    2. [Mensagens de Commit](#mensagens-de-commit)
    3. [Versionamento](#versionamento)

### Inspirações e Limitações

Este documento foi inspirado em três grandes padrões de desenvolvimento: o padrão de código do projeto GNU, criado por Richard Stallman em 1983; o padrão adotado pelo Kernel Linux, desenvolvido por Linus Torvalds em 1991; e as diretrizes estabelecidas pela Google para bases de código em C++.

Como nosso foco principal é o desenvolvimento na linguagem Swift, também incorporamos as recomendações oficiais da Apple para seus projetos, adaptando-as quando necessário para o contexto educacional da Apple Developer Academy | Mackenzie. Além disso, foram consideradas as convenções específicas que emergiram da comunidade SwiftUI, sempre buscando equilibrar boas práticas de programação com as necessidades pedagógicas dos Jr. Learners.

### Estilo de Código

#### Convenções Simples
* Sempre utilize inglês para dar nome a dados e escrever comentários;
* Sempre utilize inglês para dar nome a arquivos;

Incorreto:
```swift
// Dados da pessoa
let idadePessoa: Int = 75
let nomePessoa: String = "Chevis"

// arquivo: Pessoa.swift
```

Correto:
```swift
// Person data
let personAge: Int = 75
let personName: String = "Chevis"

// file: Person.swift
```

#### Linhas
* Utilize o intervalo de 75 à 100 caracteres para o tamanho **máximo** das linhas;

#### Recuo e Indentação
* Utilize o padrão K&R para chaves;

Incorreto:
```swift
if let x = y 
{
    [...]
}
```
```swift
if let x = y 
{
    [...]
} else
{
    [...]
}
```

Correto:
```swift
if let x = y {
    [...]
}
```
```swift
if let x = y {
    [...]
}
else {
    [...]
}
```

* Utilize 4 espaços para as tabulações. Evite o caractere de tabulação (`\t`);

#### Convenções de Nomenclatura
* Camel case para: variáveis, funções e parâmetros;
```swift
var packageLength: Int = 32

func decodePackage(packageLength : Int) {
    [...]
}
```
* Pascal case para: classes, estruturas, enumerações, protocolos e arquivos;
```swift
class PackageInfo {
    [...]
}

struct PackageInfo {
    [...]
}

enum PackageType {
    [...]
}

protocol PackageProtocol {
    [...]
}
```

* Membros privados devem utilizar `private` ou `_` para se diferenciarem;
```swift
class PackageInfo {
    private var packageLength: Int
    [...]
}

class PackageInfo {
    var _packageLength: Int
    [...]
}
```

#### Tratamento de Optionals
* Dê preferencia a `guard let` sobre `if let` para verificar variáveis optionals;

Prefira isso:
```swift
var optionalVariable: Int? = optionalFunction()

guard let variable = optionalVariable else {
    [...]
}
```

Ao invés disso:
```swift
var optionalVariable: Int? = optionalFunction()

if let variable = optionalVariable {
    [...]
}
```

* Evite force unwrapping (`!`);

#### Organização de Declarações
* Ordem recomendada:
    1. Membros que utilizem `@ObservedObject`/`@Enviroment`/`@Bindable`/`@Published`/`@Binding`/`@State`;
    2. Atributos públicos;
    3. Atributos privados;
    4. Métodos públicos;
    5. Métodos privados;

Exemplo:
```swift
class Car {
    public var name: String
    public var color: String
    public var fuelLevel: Int

    private let id: Int
    private let engineId: String
    private let keyPattern: String

    init(name: String, color: String) {
        [...]
    }

    public func startEngine() {
        [...]
    }

    public func stopEngine() {
        [...]
    }

    private func sendFuelToEngine() {
        [...]
    }

    private func turnCombustionOn() {
        [...]
    }
}
```

#### Espaçamento
* Utilize um espaço antes e um após operadores;

Incorreto:
```swift
let alpha: Int = beta+gamma
```
Correto:
```swift
let alpha: Int = beta + gamma
```

* Utilize **uma** linha em branco para separar funções/métodos;

Incorreto:
```swift
func foo() {
    [...]
}
func bar() {
    [...]
}
```
Correto:
```swift
func foo() {
    [...]
}

func bar() {
    [...]
}
```
* Utilize uma linha em branco para separar blocos de lógica;

Incorreto:
```swift
let alpha: Double = (2 * x + y) / 9
let beta: Double = squareRoot(alpha)
if beta > 1.0 {
    [...]
}
else {
    [...]
}
```
Correto:
```swift
let alpha: Double = (2 * x + y) / 9
let beta: Double = squareRoot(alpha)

if beta > 1.0 {
    [...]
}
else {
    [...]
}
```

* Não utilize um espaço antes de dois-pontos em declarações de tipos e atribuição de argumentos;

Incorreto:
```swift
let number : Int = 10

let number:Int = 10
```

Correto:
```swift
let number: Int = 10
```

#### Comentários
* Utilize `//` para escrever comentários de uma linha. Utilize para explicar linhas complexas;
* Utilize `/* */` para escrever blocos de comentário multi-linha. Utilize para explicar blocos de lógica;
* Utilize `// MARK:`, `// TODO:` e `// FIXME:` para adicionar marcações de navegação no Xcode;

### Desenvolvimento e Versionamento

#### Convenções Simples
* Sempre utilize `git`/`Github` para armazenar, versionar, documentar e publicar seus projetos;
* Sempre utilize inglês para construir mensagens de commit;


#### Mensagens de Commit
* Utilize os prefixos `feat:`, `fix:`, `remove:` e `refactor:` para explicar seus commits; 
```
feat: added a function to calculate the inverse square root.
fix: fixed the inverse square root function to throw an error when negative number is sent as an argument.
remove: removed the inverse square root function.
refactor: refactored the inverse square root function to work at O(sqrt(n))
```

#### Versionamento
* Faça o uso de branches para desenvolver novas features, corrigir problemas e experimentar com segurança;
* Faça o uso de tags e releases para lançar seu projeto de maneira organizada;
* Faça uso de pull requests para unir diferentes branches e evitar problemas de merge;
