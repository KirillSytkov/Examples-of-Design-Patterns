import Foundation

protocol Apple {
   func getPrice() -> Decimal
   func getDescription() -> String
}

//MARK: - Decorator
class AppleDecorator: Apple {
   private let decoratedApple: Apple
   
   required init(dp: Apple) {
      self.decoratedApple = dp
   }
   
   func getPrice() -> Decimal {
      return decoratedApple.getPrice()
   }
   
   func getDescription() -> String {
      return decoratedApple.getDescription()
   }
   
}

//MARK: - Updates
class UpdateStorage: AppleDecorator {
   required init(dp: Apple) {
      super.init(dp: dp)
   }
   
   override func getPrice() -> Decimal {
      return super.getPrice() + 100
   }
   
   override func getDescription() -> String {
      return super.getDescription() + " with 512 gb"
   }
}

class UpdateRAM: AppleDecorator {
   required init(dp: Apple) {
      super.init(dp: dp)
   }
   
   override func getPrice() -> Decimal {
      return super.getPrice() + 150
   }
   
   override func getDescription() -> String {
      return super.getDescription() + " with 16 gb RAM"
   }
}

//MARK: - Test class
class Macbook: Apple {
   func getPrice() -> Decimal {
      return 1500
   }
   
   func getDescription() -> String {
      return "Macbook pro 13"
   }
}

//MARK: - Tests
var macbook: Apple = Macbook()

macbook.getPrice()
macbook.getDescription()

macbook = UpdateRAM(dp: macbook)
macbook = UpdateStorage(dp: macbook)

macbook.getPrice()
macbook.getDescription()

