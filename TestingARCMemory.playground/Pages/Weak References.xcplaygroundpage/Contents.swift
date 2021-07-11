//: [Previous](@previous)

// MARK: - RESOLVENDO FORTES CICLOS DE REFERÊNCIA ENTRE INSTÂNCIAS DE CLASSE

// MARK: - MODO 1: Referências fracas

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
// Prints "John Appleseed is being deinitialized"

unit4A = nil
// Prints "Apartment 4A is being deinitialized"

//: [Next](@next)
