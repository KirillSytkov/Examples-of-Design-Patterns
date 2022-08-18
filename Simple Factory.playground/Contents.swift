import Foundation

enum CarType {
   case sport, truck
}

protocol Car {
   func drive()
}


class SportCar: Car {
   func drive() {
      print("drive sport car")
   }
}

class Truck: Car {
   func drive() {
      print("drive truck")
   }
}

//MARK: - Factory
class CarFactory {
   static func producerCar(type: CarType) -> Car {
      var car: Car
      
      switch type {
      case .sport: car = SportCar()
      case .truck: car = Truck()
      }
      
      return car
   }
}

//MARK: - Tests
let newTruck = CarFactory.producerCar(type: .truck)
let newSportCar = CarFactory.producerCar(type: .sport)

newTruck.drive()
newSportCar.drive()




