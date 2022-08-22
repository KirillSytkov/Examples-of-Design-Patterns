
protocol Command {
   func execute()
   var isComplete: Bool { get set}
}

class Account {
   var accountName: String
   var balance: Int
   
   init(accountName: String, balance: Int) {
      self.accountName = accountName
      self.balance = balance
   }
}


class Deposit: Command {

   private var account: Account
   private var amount: Int
   var isComplete = false
   
   init(account: Account, amount: Int) {
      self.account = account
      self.amount = amount
   }
   
   func execute() {
      account.balance += amount
      isComplete = true
   }
   
}

class Withdraw: Command {

   private var account: Account
   private var amount: Int
   var isComplete = false
   
   init(account: Account, amount: Int) {
      self.account = account
      self.amount = amount
   }
   
   func execute() {
      if account.balance >= amount {
         account.balance -= amount
         isComplete = true
      } else {
         print("Not enough money")
      }
   }
   
}

class TransactionManager {
   static let shared = TransactionManager()
   private init() {}
   private var transaction: [Command] = []
   
   var pendingTransactions: [Command] {
      get {
         self.transaction.filter{$0.isComplete == false }
      }
   }
   
   
   func addTransactions(command: Command) {
      self.transaction.append(command)
   }
   
   func processingTransaction() {
      transaction.filter{$0.isComplete == false}.forEach{ $0.execute() }
   }
}

//MARK: - Tests

let account = Account(accountName: "Kirill", balance: 1000)

TransactionManager.shared.addTransactions(command: Deposit(account: account, amount: 200))
TransactionManager.shared.pendingTransactions
TransactionManager.shared.processingTransaction()
account.balance

TransactionManager.shared.addTransactions(command: Withdraw(account: account, amount: 800))
TransactionManager.shared.processingTransaction()
account.balance
