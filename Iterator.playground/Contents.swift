class Driver {
   let isGoodDriver: Bool
   let name: String
   
   init(isGood: Bool, name: String) {
      self.isGoodDriver = isGood
      self.name = name
   }
}

class Car {
   var goodDriverIterator: GoodDriverIterator {
      return GoodDriverIterator(drivers: drivers)
   }
   var badDriverIterator: BadDriverIterator {
      return BadDriverIterator(drivers: drivers)
   }
   
   private let drivers = [Driver(isGood: true, name: "Kirill"),
                          Driver(isGood: true, name: "Natali"),
                          Driver(isGood: false, name: "Andrei"),
                          Driver(isGood: false, name: "Ivan"),
                          Driver(isGood: true, name: "Igor"),
                          Driver(isGood: false, name: "Artem")]
}

protocol BasicIterator: IteratorProtocol {
   init(drivers: [Driver])
   func allDrivers() -> [Driver]
}

class GoodDriverIterator: BasicIterator {
   
   private let drives: [Driver]
   private var current: Int = 0
   
    required init(drivers: [Driver]) {
      self.drives = drivers.filter{ $0.isGoodDriver }
   }
   
   func next() -> Driver? {
      defer { current += 1}
      return drives.count > current ? drives[current] : nil
   }
   
   func allDrivers() -> [Driver] {
      return drives
   }
}

class BadDriverIterator: BasicIterator  {
   private let drives: [Driver]
   private var current: Int = 0
   
   required init(drivers: [Driver]) {
      self.drives = drivers.filter{ !$0.isGoodDriver }
   }
   
   func next() -> Driver? {
      defer { current += 1}
      return drives.count > current ? drives[current] : nil
   }
   
   func allDrivers() -> [Driver] {
      return drives
   }
}
//MARK: - Tests
let car = Car()

let goodDriverIterator = car.goodDriverIterator.next()
let goodDrivers = car.goodDriverIterator.allDrivers()

let badDriverIterator = car.badDriverIterator.next()
let badDrivers = car.badDriverIterator.allDrivers()
