protocol MilitaryChain {
   var stregnth: Int { get }
   var nextRank: MilitaryChain? { get set }
   func shouldDefeatWithStrength(amount: Int)
}

class Enemy {
   let strength = 300
}

class Soldier: MilitaryChain {
   var stregnth: Int = 100
   var nextRank: MilitaryChain?
   
   func shouldDefeatWithStrength(amount: Int) {
      if amount < stregnth {
         print("Soldier win")
      } else {
         nextRank?.shouldDefeatWithStrength(amount: amount)
      }
   }
}

class Officer: MilitaryChain {
   var stregnth: Int = 200
   var nextRank: MilitaryChain?
   
   func shouldDefeatWithStrength(amount: Int) {
      if amount < stregnth {
         print("Officer win")
      } else {
         nextRank?.shouldDefeatWithStrength(amount: amount)
      }
   }
}

class General: MilitaryChain {
   var stregnth: Int = 350
   var nextRank: MilitaryChain?
   
   func shouldDefeatWithStrength(amount: Int) {
      if amount < stregnth {
         print("General win")
      } else {
         print("we can't defeat this enemy")
      }
   }
}

//MARK: - Tests

let enemy = Enemy()
let soldier = Soldier()
let officer = Officer()
let general = General()

soldier.nextRank = officer
officer.nextRank = general

soldier.shouldDefeatWithStrength(amount: enemy.strength)
soldier.shouldDefeatWithStrength(amount: 150)
soldier.shouldDefeatWithStrength(amount: 80)
