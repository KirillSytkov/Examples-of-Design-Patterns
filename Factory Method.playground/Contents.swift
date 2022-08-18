import Foundation

protocol Vehicle {
   func drive()
}

protocol VehicleFactory {
   func produce() -> Vehicle
}


class CarFactory: VehicleFactory {
   func produce() -> Vehicle {
      print("car is created")
      return Car()
   }
}

class TruckFactory: VehicleFactory {
   func produce() -> Vehicle {
      print("truck is created")
      return Truck()
   }
}

class Car: Vehicle {
   func drive() {
      print("drive a car")
   }
}

class Truck: Vehicle {
   func drive() {
      print("drive a truck")
   }
}


//MARK: - Tests
let truckFactory = TruckFactory()
let truck = truckFactory.produce()
truck.drive()

let carFactory  = CarFactory()
let car = carFactory.produce()
car.drive()
