 
class Singleton {
   static let shared = Singleton()
   
   private init() {}
   
   func doSmth1() {
      print("test 1")
   }
   
   func doSmth2() {
      print("test 2")
   }
}

//MARK: - Tests

Singleton.shared.doSmth1()
Singleton.shared.doSmth2()
