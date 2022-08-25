import UIKit
 
protocol ThemeProtocol {
   var backgroundColor: UIColor { get }
   var textColor: UIColor { get }
}

protocol ThemeBuilderProtocol {
   func setBackground(color: UIColor)
   func setText(color: UIColor)
   func createTheme() -> ThemeProtocol?
}

class Theme: ThemeProtocol {
   var backgroundColor: UIColor
   var textColor: UIColor
   
   init(backgroundColor: UIColor, textColor: UIColor) {
      self.backgroundColor = backgroundColor
      self.textColor = textColor
   }
   
}

class ThemeBuilder: ThemeBuilderProtocol {
   private var backgorundColor: UIColor?
   private var textColor: UIColor?
   
   func setBackground(color: UIColor) {
      self.backgorundColor = color
   }
   
   func setText(color: UIColor) {
      self.textColor = color
   }
   
   func createTheme() -> ThemeProtocol? {
      guard let backgorundColor = backgorundColor, let textColor = textColor else {
         return nil
      }
      
      return Theme(backgroundColor: backgorundColor, textColor: textColor)
   }
}

//MARK: - Tests

let builder = ThemeBuilder()
builder.setText(color: .white)
builder.setBackground(color: .blue)
let theme = builder.createTheme()

print(theme)

