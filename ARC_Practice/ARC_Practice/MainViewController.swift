import UIKit

class MainViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    runScenario()
  }

  func runScenario() {
    let user = User(name: "John")
    let iPhone = Phone(model: "iPhone Xs")
    user.add(phone: iPhone)
    iPhone.owner = user

    let subscription = CarrierSubscription(
      name: "TelBel",
      countryCode: "0032",
      number: "31415926",
      user: user)
    iPhone.provision(carrierSubscription: subscription)

    print(subscription.completePhoneNumber())

    let greetingMaker: () -> String

    do {
      let mermaid = WWDCGreeting(who: "caffeinated mermaid")
      greetingMaker = mermaid.greetingMaker
    }

    print(greetingMaker())

      do {
        let ernie = Person(name: "Ernie")
        let bert = Person(name: "Bert")

        ernie.friends.append(Unowned(bert))
        bert.friends.append(Unowned(ernie))
          let firstFriend = bert.friends.first?.value
      }
      
  }
}

class User {
  let name: String
  var subscriptions: [CarrierSubscription] = []
  private(set) var phones: [Phone] = []

  init(name: String) {
    self.name = name
    print("User \(name) was initialized")
  }

  deinit {
    print("Deallocating user named: \(name)")
  }

  func add(phone: Phone) {
    phones.append(phone)
    phone.owner = self
  }
}

class Phone {
  let model: String
  weak var owner: User?
  var carrierSubscription: CarrierSubscription?

  init(model: String) {
    self.model = model
    print("Phone \(model) was initialized")
  }

  deinit {
    print("Deallocating phone named: \(model)")
  }

  func provision(carrierSubscription: CarrierSubscription) {
    self.carrierSubscription = carrierSubscription
  }

  func decommission() {
    carrierSubscription = nil
  }
}

class CarrierSubscription {
  let name: String
  let countryCode: String
  let number: String
  unowned let user: User
  lazy var completePhoneNumber: () -> String = { [unowned self] in
    return self.countryCode + " " + self.number
  }

  init(name: String, countryCode: String, number: String, user: User) {
    self.name = name
    self.countryCode = countryCode
    self.number = number
    self.user = user
    user.subscriptions.append(self)

    print("CarrierSubscription \(name) is initialized")
  }

  deinit {
    print("Deallocating CarrierSubscription named: \(name)")
  }
}

class WWDCGreeting {
  let who: String

  init(who: String) {
    self.who = who
  }

  lazy var greetingMaker: () -> String = { [weak self] in
    guard let self = self else {
      return "No greeting available."
    }
    return "Hello \(self.who)."
  }
}

class Node {
  var payload = 0
  var next: Node?
}

class Unowned<T: AnyObject> {
  unowned var value: T
  init (_ value: T) {
    self.value = value
  }
}

class Person {
  var name: String
  var friends: [Unowned<Person>] = []
  init(name: String) {
    self.name = name
    print("New person instance: \(name)")
  }

  deinit {
    print("Person instance \(name) is being deallocated")
  }
}
