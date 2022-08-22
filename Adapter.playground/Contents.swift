
protocol SportcarProtocol {
   func sportsDriving() -> String
}


class SimpleCar {
   
   func sipmleDrive() -> String {
      return "drive a simple car"
   }
   
}

class Sportcar: SportcarProtocol {
   
   func sportsDriving() -> String {
      return "sports driving"
   }
   
}

//adaptor
class SportcarAdaptor: SportcarProtocol {
   var simpleCar: SimpleCar
   
   init(simpleCar: SimpleCar) {
      self.simpleCar = simpleCar
   }
   
   func sportsDriving() -> String {
      return simpleCar.sipmleDrive()
   }
}

//MARK: - Tests

let adaptor = SportcarAdaptor(simpleCar: SimpleCar())
adaptor.sportsDriving()

