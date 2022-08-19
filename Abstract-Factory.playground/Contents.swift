import Foundation

protocol Car {
   func drive()
}

protocol Bus {
   func drive()
}

protocol Factory {
   func produceBus() -> Bus
   func produceCar() -> Car
}



class LittleCar: Car {
   func drive() {
      print("drive Little car")
   }
}

class MiddleCar: Car {
   func drive() {
      print("drive Middle car")
   }
}


class LittleBus: Bus {
   func drive() {
      print("drive little bus")
   }
}

class MiddleBus: Bus {
   func drive() {
      print("drive middle bus")
   }
}

class LittleSizeFactory: Factory {
   func produceBus() -> Bus {
      print("little bus is created")
      return LittleBus()
   }
   
   func produceCar() -> Car {
      print("litle car is created")
      return LittleCar()
   }
}

class MiddleSizeFactory: Factory {
   func produceBus() -> Bus {
      print("Middle bus is created")
      return MiddleBus()
   }
   
   func produceCar() -> Car {
      print("Middle car is created")
      return MiddleCar()
   }
}

//MARK: - Tests

let littleFactory = LittleSizeFactory()
let littleCar = littleFactory.produceCar()
littleCar.drive()

let middleFactory = MiddleSizeFactory()
let middleBus = middleFactory.produceBus()
middleBus.drive()
