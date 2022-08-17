
protocol SwimBehaviour  {
   func swim()
}

protocol DiveBehaviour {
   func dive()
}

class ProfessionalSwimmer: SwimBehaviour {
   func swim() {
      print("proffesional swiming")
   }
}

class NonSwimmer: SwimBehaviour {
   func swim() {
      print("non-swimming")
   }
}

class ProfessionalDiver: DiveBehaviour {
   func dive() {
      print("proffesional diver")
   }
}

class NonDiver: DiveBehaviour {
   func dive() {
      print("non-diver")
   }
}

class Human {
   
   private var swimBehaviour: SwimBehaviour?
   private var diveBehaviour: DiveBehaviour?
   
   init(swimBehaviour: SwimBehaviour, diveBehaviour: DiveBehaviour) {
      self.swimBehaviour = swimBehaviour
      self.diveBehaviour = diveBehaviour
   }
   
   func performSwim() {
      swimBehaviour?.swim()
   }
   
   func performDive() {
      diveBehaviour?.dive()
   }
   
   func setSwimBehaviour(sb: SwimBehaviour) {
      swimBehaviour = sb
   }
   
   func setDiveBehaviour(db: DiveBehaviour) {
      diveBehaviour = db
   }
   
   func doSmth() {
    print("let's go")
   }
   
}

let human = Human(swimBehaviour: ProfessionalSwimmer(), diveBehaviour: NonDiver())
human.performDive()
human.performSwim()
human.doSmth()

human.setDiveBehaviour(db: ProfessionalDiver())
human.performDive()
