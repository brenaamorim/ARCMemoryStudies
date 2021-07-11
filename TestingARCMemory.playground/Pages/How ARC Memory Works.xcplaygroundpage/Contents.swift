import Cocoa

// MARK: - COMO A MEMÓRIA ARC FUNCIONA

// 1. Temos uma classe Person
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

// 2. Criamos várias variáveis do tipo Person
var reference1: Person?
var reference2: Person?
var reference3: Person?

// 3. Atribuímos uma instância de Person à variável reference1
reference1 = Person(name: "John Appleseed")

// 4. A mesma instância de Person é atribuída às variáveis reference2 e reference3
// Temos 3 referências à  mesma instância Person
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil

// 4. A mémoria ARC só desalocará essa instância de Person quando a última referência a ela for quebrada
reference3 = nil
// Aqui a mensagem "John Appleseed is being deinitialized" é apresentada :D
