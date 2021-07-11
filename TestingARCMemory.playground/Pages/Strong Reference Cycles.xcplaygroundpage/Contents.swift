//: [Previous](@previous)

import Foundation

// MARK: - CICLOS DE REFERÊNCIA FORTES ENTRE INSTÂNCIAS DE CLASSE

// 1. Temos uma classe Person e uma classe Apartment. A classe Person possui um atributo que faz referência à classe Apartment e vice versa
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

// 2. Criamos uma pessoa do tipo Person e uma unidade do tipo Apartment
var john: Person?
var unit4A: Apartment?

// 3. john e unit4A são inicializados e fazem referências às instâncias Person e Apartment respectivamente.
john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

// 4. Vinculamos o atributo apartment da instância Person john à unit4A e o atributo tenant da instância Apartment à john
john!.apartment = unit4A
unit4A!.tenant = john

// 5. Temos algumas referencias fortes aqui
// - john e a instância Person
// - unit4A e a instância Apartment
// - O atributo apartment da instancia Person que referencia a instancia Apartment
// - O atributo tenant da instancia Apartament que referencia a instancia Person
john = nil
unit4A = nil
// 6. Ao atribuir nil a john e unit4A, apenas as duas primeiras referencias são apagadas
// 7. Lembrando que a ARC só desaloca essas instâncias quando não sobrar nenhuma referência!

//: [Next](@next)
