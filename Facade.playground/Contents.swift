

class FruitShop {
   func buyFruits() -> String {
   return "fruits"
   }
}

class MeatShop {
   func buyMeat() -> String {
      return "meat"
   }
}

class SweetShop {
   func buySweets() -> String {
      return "sweets"
   }
}

class BreadShop {
   func buyBread() -> String {
      return "bread"
   }
}


class Supermarket {
   private let fuitShop = FruitShop()
   private let meatShop = MeatShop()
   private let sweetShop = SweetShop()
   private let breadShop = BreadShop()
   
   func buyProducts() -> String {
      var products = ""
      
      products += fuitShop.buyFruits() + ", "
      products += meatShop.buyMeat() + ", "
      products += sweetShop.buySweets() + ", "
      products += breadShop.buyBread() + ", "
      
      return products
   }
   
}
//MARK: - Tests

let market = Supermarket()
market.buyProducts()

