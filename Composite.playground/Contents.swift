import Security
protocol Coworker {
   func hire(coworker: Coworker)
   func getInfo()
   var level: Int { get }
}

//MARK: - Branch

class Manager: Coworker {
   private var coworkers = [Coworker]()
   var level: Int
   
   init(level: Int) {
      self.level = level
   }
   
   func hire(coworker: Coworker) {
      self.coworkers.append(coworker)
   }
   
   func getInfo() {
      print(self.level.description + " level manager")
      for coworker in coworkers {
         coworker.getInfo()
      }
   }
}
   
//MARK: - Leaf
class LowLevelManager: Coworker {
   var level: Int
   
   init(level: Int) {
      self.level = level
   }
   
   func hire(coworker: Coworker) {
      print("can't hire")
   }
   
   func getInfo() {
      print(self.level.description + " level manager")
   }
}

//MARK: - Tests

let managerLvl1 = Manager(level: 1)
let managerLvl2 = Manager(level: 2)
let managerLvl3_1 = Manager(level: 3)
let managerLvl3_2 = Manager(level: 3)
let managetLvl5 = Manager(level: 5)

managerLvl1.hire(coworker: managerLvl2)
managerLvl2.hire(coworker: managerLvl3_1)
managerLvl2.hire(coworker: managerLvl3_2)
managerLvl3_1.hire(coworker: managetLvl5)

managerLvl1.getInfo()
