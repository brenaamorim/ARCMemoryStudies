//: [Previous](@previous)

import Foundation

// MARK: - RESOLVENDO FORTES CICLOS DE REFERÊNCIA ENTRE INSTÂNCIAS DE CLASSE
// MARK: - MODO 1: Referências fracas

// 1. Temos as mesmas classes Person e Apartment.
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }

//2. Dessa vez, para evitar que haja um ciclo de referência forte entre as classes, declaramos tenant como uma weak var. Tornando tenant uma referência fraca à instancia Person
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

//3. As referências fortes das duas variáveis (john e unit4A) e os links entre as duas instâncias são criados como antes:
var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john
// As referências fortes criadas nesse momento são:
// 1. A variável john e a instância Person
// 2. O atributo apartament da instancia Person(john) e a instância Apartment(unit4A)

//4. Agora, note que a instância Apartment possui uma referencia fraca à instância Person e não mais uma referência forte como antes (var tenant). Isso significa que quando você quebra a referência forte mantida pela variável john definindo-a como nil, não há mais referências fortes para a instância Person.
john = nil
// Mostra "John Appleseed is being deinitialized". Ao atribuir nil a john, não existem mais referências à instância Person e então ela será desalocada pela memória ARC.

//5. A única referência forte restante para a instância Apartment é da variável unit4A. Se você quebrar essa referência forte, não haverá mais referências fortes para a instância Apartment.
unit4A = nil
// Mostra "Apartment 4A is being deinitialized". Como não há mais referências fortes à instância Apartment, ela também é desalocada.


// DICA: Use uma referência fraca(weak var) quando a outra instância tiver uma vida útil mais curta, ou seja, quando a outra instância puder ser desalocada primeiro. No exemplo Apartment acima, é apropriado que um apartamento não possa ter inquilino em algum momento de sua vida e, portanto, uma referência fraca é uma maneira apropriada de quebrar o ciclo de referência neste caso.

//: [Next](@next)

