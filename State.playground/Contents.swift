protocol State {
   func on(printer: Printer)
   func off(printer: Printer)
   func printDocument(printer: Printer)
}

class On: State {
   func on(printer: Printer) {
      print("it is On already")
   }
   
   func off(printer: Printer) {
      print("turning printer off")
      printer.set(state: Off())
   }
   
   func printDocument(printer: Printer) {
      print("printing document")
      printer.set(state: Print())
   }
   
}

class Off: State {
   func on(printer: Printer) {
      print("turning on")
      printer.set(state: On())
   }
   
   func off(printer: Printer) {
      print("it is already off")
      
   }
   
   func printDocument(printer: Printer) {
      print("can't printing. Printer is off")
   }
   
}

class Print: State {
   func on(printer: Printer) {
      print("it is On already")
   }
   
   func off(printer: Printer) {
      print("turning printer off")
      printer.set(state: Off())
   }
   
   func printDocument(printer: Printer) {
      print("It is already printing")
      printer.set(state: Print())
   }
}

class Printer {
   var state: State
   
   init() {
      self.state = Off()
   }
   
   func set(state: State) {
      self.state = state
   }
   
   func turnOn() {
      state.on(printer: self)
   }
   
   func turnOff() {
      state.off(printer: self)
   }
   
   func printDocument() {
      state.printDocument(printer: self)
   }
}

//MARK: - Tests

let printer = Printer()
printer.turnOff()
printer.turnOn()
printer.printDocument()
printer.turnOff()
printer.printDocument()
