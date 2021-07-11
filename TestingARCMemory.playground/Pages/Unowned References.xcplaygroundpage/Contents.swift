//: [Previous](@previous)

import Foundation

// MARK: - MODO 2: Referências não proprietárias

// 1. Temos uma classe Customer e uma classe CreditCard. A classe Customer possui um atributo que faz referência à classe CreditCard e vice versa
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64

// 2. Para evitar um ciclo de referência forte entre as classes, declaramos customer como unowned (Referência não proprietária)
// Observe que customer não é um propriedade opcional. Atributos unowned sempre devem possuir um valor
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

// 3. Essa variável Customer opcional chamada john será usada para armazenar uma referência a um cliente específico
var john: Customer?

// 4. Agora você pode criar uma instância Customer e usá-la para inicializar e atribuir uma nova instância CreditCard como propriedade card desse cliente
john = Customer(name: "John")
john?.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)

// Nesse caso, temos as seguintes referências fortes:
// 1. A variável john e a instância Customer
// 2. O atributo card da instância Customer que referencia a instância CreditCard

// 5. Por causa da referência do tipo unowned customer, quando você quebra a referência forte mantida pela variável john, não há mais referências fortes para a instância Customer.
john = nil
// 6. Como não há mais referências fortes à instância Customer, ela é desalocada. Depois que isso acontecer, não haverá mais referências fortes à instância CreditCard e ela também será desalocada



// DICA: Ao contrário de uma referência fraca, uma referência sem proprietário é usada quando a outra instância tem o mesmo tempo de vida ou um tempo de vida mais longo.

//: [Next](@next)
