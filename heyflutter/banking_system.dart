// ignore_for_file: public_member_api_docs, sort_constructors_first
// Create a Banking System.
/**  
 Create a program that models a simple banking system which demonstrates abstraction, inheritance, polymorphism, encapsulation, getters and setters, and mixins. 
*/

void main(List<String> args) {
  // Create Instances and Demonstrate Functionality
  EncapsulatedBankAccount myAccount = EncapsulatedBankAccount();

  // Create instances of SavingsAccount and CheckingAccount.
  EncapsulatedSavingsAccount savingsAccount = EncapsulatedSavingsAccount();
  EncapsulatedCheckingAccount checkingAccount = EncapsulatedCheckingAccount();

  // Use setter methods to set account details.
  myAccount.setAccountNumber("0000001234");
  myAccount.setAccountHolderName("Tanko");
  myAccount.setBalance(700);
  myAccount.deposit(800);

  // For Savings
  savingsAccount.setBalance(myAccount.balance);
  savingsAccount.setInterestRate(5);
  savingsAccount.deposit(200);

  // For checking
  checkingAccount.setBalance(myAccount.balance);
  checkingAccount.setOverdraftFee(800);
  checkingAccount.setAccountHolderName("Alhaji Tanko");
  checkingAccount.deposit(400);
  checkingAccount.withdraw(1200);
  checkingAccount.setAccountHolderName("Miss Pepeye");
  checkingAccount.withdraw(2000);

  // Demonstrate the calculateInterest() method for the SavingsAccount instance.

  savingsAccount.calculateInterest();

  // Demonstrate the transaction history functionality using methods from the TransactionHistoryMixin.
  savingsAccount.addTransaction("Depositing \$200 on Thursday");
  savingsAccount.addTransaction(
      "Your savings account balance is ${savingsAccount._balance}");
  checkingAccount.addTransaction(
      "Getting an overdraft of \$2000 from ${checkingAccount._accountHolderName} account");
  checkingAccount.addTransaction(
      "Withdrawing from ${checkingAccount._accountHolderName}}");

  print(savingsAccount.getTransactionHistory());
  print(checkingAccount.getTransactionHistory());

  printAccountDetails(myAccount);
}

// Create a Class Hierarchy
/** Question(1).  BankAccount (Abstract Class):
 * Create an abstract class named BankAccount.
 * Include properties:
   - accountNumber (int)
   - accountHolderName (String)
   - balance (double).
  * Define abstract methods:
   - double calculateInterest()
   - void deposit(double amount).

 */

abstract class BankAccount {
  int accountNumber;
  String accountHolderName;
  double balance;
  BankAccount({
    this.accountNumber = 1234567890,
    this.accountHolderName = 'Tanko',
    this.balance = 10000,
  });

  calculateInterest() {}

  void deposit(double amount) {}
}

/** Question(2). SavingsAccount (Inherited Class): 
 * Create a class named SavingsAccount that inherits from BankAccount.
 * Include an additional property: interestRate (double).
 * Implement the calculateInterest() method to return the calculated interest based on the balance and interest rate.
*/

class SavingsAccount extends BankAccount {
  double? interestRate;
  SavingsAccount({
    this.interestRate,
  });

  @override
  calculateInterest() {
    var interest = balance * interestRate! / 100;
    return interest;
  }
}

/** Question(3). CheckingAccount (Inherited Class): 
  * Create a class named CheckingAccount that inherits from BankAccount.
  * Include an additional property: transactionLimit (int).
  * Implement the deposit() method to include a check for transaction limit, and update the balance accordingly.
 */

class CheckingAccount extends BankAccount {
  int? transactionLimit;
  CheckingAccount({
    this.transactionLimit,
  });

  @override
  void deposit(double amount) {
    if (transactionLimit! < 2) {
      balance = balance + amount;
    }
    print(
        "The new balance for account number $accountNumber, own by $accountHolderName is: $balance");
  }
}

// Implement Encapsulation and Getters/Setters
/** Question(1). Encapsulate the properties of the BankAccount, SavingsAccount, and CheckingAccount classes using private instance variables and provide appropriate getter and setter methods for each property. */
class EncapsulatedBankAccount {
  // Private variables for encapsulation
  String? _accountNumber;
  String? _accountHolderName;
  double? _balance;

  // // Constructor
  // EncapsulatedBankAccount(
  //     this._accountNumber, this._accountHolderName, this._balance);

  
  // Setters

  setAccountNumber(String accountNumber) {
    _accountNumber = accountNumber;
  }

  setAccountHolderName(String newName) {
    // Add any validation if needed
    _accountHolderName = newName;
  }

  setBalance(double newBalance) {
    // Add any validation if needed
    _balance = newBalance;
  }

  // Getters
  String get accountNumber => _accountNumber!;
  String get accountHolderName => _accountHolderName!;
  double get balance => _balance!;


  // Example methods (can be added as needed)
  void deposit(double amount) {
    _balance = _balance! + amount;
    print("You deposited $amount, and your balance is \$$_balance");
  }

  void withdraw(double amount) {
    if (amount <= _balance!) {
      _balance = _balance! - amount;
      print("$amount withdraw and renaining balance: $_balance");
    } else {
      // Handle insufficient funds
      print("Insufficient funds for withdrawal.");
    }
  }

  // Function to print account details
  void printAccountDetails() {
    print("Account Number: $accountNumber");
    print("Account Holder Name: $accountHolderName");
    print("Balance: $balance");
  }
}

class EncapsulatedSavingsAccount extends EncapsulatedBankAccount
    with TransactionHistoryMixin {
  double? _interestRate;

  // EncapsulatedSavingsAccount(this._interestRate) : super();

  // Getters
  double get interestRate => _interestRate!;

  // Setters

  setInterestRate(double interestRate) {
    _interestRate = interestRate;
  }

  @override
  void deposit(double amount) {
    print("initial balance is $_balance");
    double newBalance = _balance! + amount;
    print(
        "Savings account: You deposited $amount and new balance is $newBalance");
  }

  void calculateInterest() {
    // Calculate and print interest based on balance and interestRate
    double interest = _balance! * _interestRate! / 100;
    print("Interest Rate: $_interestRate%");
    print("Interest Earned: \$$interest");
  }
}

class EncapsulatedCheckingAccount extends EncapsulatedBankAccount
    with TransactionHistoryMixin {
  double? _overdraftFee;
  double? newBalance;

  // EncapsulatedCheckingAccount(this._overdraftFee) : super();

  // Getters
  double get overdraftFee => _overdraftFee!;

  // Setters

  setOverdraftFee(double overdraftFee) {
    _overdraftFee = overdraftFee;
  }

  @override
  void deposit(double amount) {
    print("checking account initial balance is $_balance");
    newBalance = _balance! + amount;
    print(
        "Checking account: You deposited $amount and new balance is $newBalance");
  }

  void withdraw(double amount) {
    print("checking account initial balance is $newBalance");
    if (amount > newBalance!) {
      print(
          "Insufficient funds. Overdraft fee of \$$_overdraftFee will be applied.");
    } else {
      newBalance = newBalance! - amount;
      print("You are trying to withdraw $amount and you balance is $newBalance");
    }
    
  }
}

// Implement Polymorphism
/** Question(1). Create a function named printAccountDetails(BankAccount account) that accepts a BankAccount object as a parameter and prints its account details including the account number, account holder name, and balance. */

// Polymorphic function to print account details
void printAccountDetails(EncapsulatedBankAccount account) {
  // Print common details
  account.printAccountDetails();

  // Check for specific account types and print additional details
  if (account is EncapsulatedSavingsAccount) {
    (account).calculateInterest();
  } else if (account is EncapsulatedCheckingAccount) {
    print("Overdraft Fee: \$${(account)._overdraftFee}");
  }
}

// Implement Mixins
/** Question(1). Create a mixin named TransactionHistoryMixin:
 * Include a private list property: _transactionHistory (List<String>).
 * Implement methods: void addTransaction(String transaction) and List<String> getTransactionHistory().
 */

mixin TransactionHistoryMixin {
  // Private list to store transaction history
  List<String> _transactionHistory = [];

  // Add a transaction to the history
  void addTransaction(String transaction) {
    _transactionHistory.add(transaction);
    print("All transaction history $transaction");
  }

  // Get the transaction history
  List<String> getTransactionHistory() {
    return _transactionHistory;
  }
}

/** Question(2). Apply the TransactionHistoryMixin to both the SavingsAccount and CheckingAccount classes */

/** Create Instances and Demonstrate Functionality 
 * Create instances of SavingsAccount and CheckingAccount.
 * Use setter methods to set account details.
 * Demonstrate deposit functionality for both account types.
 * Demonstrate the calculateInterest() method for the SavingsAccount instance.
 * Demonstrate the transaction history functionality using methods from the TransactionHistoryMixin. 
 */


