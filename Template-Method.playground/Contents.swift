protocol DriveVehicle {
   func haveASeat()
   func closeTheDoor()
   func useProtection()
   func lookAround()
   func turnSignal()
   func driveForward()
   func startVehicle()
}

extension DriveVehicle {
   func startVehicle() {
      haveASeat()
      closeTheDoor()
      useProtection()
      lookAround()
      turnSignal()
      driveForward()
   }
   
   func closeTheDoor() {
      
   }
   
}

class Bicycles: DriveVehicle {
   func haveASeat() {
      print("sit down on a bicycle seat")
   }

   func useProtection() {
      print("wear a helmet")
   }
   
   func lookAround() {
      print("look at the little mirror")
   }
   
   func turnSignal() {
      print("show left hand")
   }
   
   func driveForward() {
      print("pedaling")
   }
}

class Car: DriveVehicle {
   
   func haveASeat() {
      print("sit down on a car seat")
   }
   
   func closeTheDoor() {
      print("close the door")
   }
   func useProtection() {
      print("fasten seat belt")
   }
   
   func lookAround() {
      print("look at the rearview mirror")
   }
   
   func turnSignal() {
      print("turn on left turn light")
   }
   
   func driveForward() {
      print("push pedal")
   }
   
}


//MARK: - Tests

let car = Car()
let bicycle  = Bicycles()

car.startVehicle()
print("-----------")
bicycle.startVehicle()

