import 'dart:io';

/** Create Bank Program

Create a BankAccount class with deposit and withdrawal methods, custom exception handling, and test it using multiple objects.
 */

// ignore_for_file: public_member_api_docs, sort_constructors_first

void main(List<String> args) {
  print(account1.detials());
  print(account2.detials());

  /** Question (f). Call the operations “deposit” and “withdraw” for all BankAccount objects that you have created in b)  */

// For deposit
  account1.deposit(1000.00);
  account1.deposit(-1000.00);
  account1.deposit(0.00);

  // for withdrawal
  account2.withdrawal(2000.00);
  account2.withdrawal(-3000.00);
  account2.withdrawal(0.00);
  account2.withdrawal(9999.00);
}

/** Question(a). Define a BankAccount class with following properties  
 * accountNumber
 * accountHolderName
 * Amount
*/
class BankAccount {
  int? accountNumber;
  String? accountHolderName;
  double? amount;
  BankAccount({
    this.accountNumber,
    this.accountHolderName,
    this.amount,
  });
  // BankAccount({
  //   this.accountNumber,
  //   this.accountHolderName,
  //   this.amount,
  // });

  detials() {
    return "This is $accountHolderName, with the account number: $accountNumber and account balance of: $amount";
  }

  deposit(deposit_amount) {
    try {
      // double depositAmount = double.parse(stdin.readLineSync()!);
      validateDepositAmount(deposit_amount);
      // Process successful deposit
      print(
          "$accountHolderName have successfully deposited $deposit_amount to this account $accountNumber");
    } on InvalidDepositAmountException catch (e) {
      print(e.message);
    } on FormatException {
      print('Invalid input. Please enter a valid number.');
    }
  }

  withdrawal(withdraw_amount) {
    try {
      // double depositAmount = double.parse(stdin.readLineSync()!);
      validateWithdrawAmount(amount!, withdraw_amount);
      // Process successful withdraw
      print(
          "$accountHolderName have successfully withdraw $withdraw_amount from your account $accountNumber");
    } on InvalidDepositAmountException catch (e) {
      print(e.message);
    } on FormatException {
      print('Invalid input. Please enter a valid number.');
    }
  }
}

/** Question (b). Create objects for multiple BankAccounts
👉  Account Number: <Account no.>
    Account Holder Name: <Name>
    Amount: <Amount>
 */

final account1 = BankAccount(
  accountNumber: 1234567890,
  accountHolderName: 'Funke Oke',
  amount: 1000,
);

final account2 = BankAccount(
  accountNumber: 9876543210,
  accountHolderName: 'Bolu Tanko',
  amount: 5000,
);

/** Question (c). Implement the following methods inside this class
- deposit()
   * with a “deposit amount” parameter
- withdraw()
   * with a “withdraw amount” parameter
 */

/** Question (d) Add custom exception handling to deposit() method
- Validate deposit amount by throwing custom exceptions for invalid input
👉 negative amount
👉 amount equals 0
 */
class InvalidDepositAmountException implements Exception {
  final String message;

  InvalidDepositAmountException(this.message);
}

class ZeroDepositAmountException extends InvalidDepositAmountException {
  ZeroDepositAmountException() : super('Deposit amount cannot be zero.');
}

class NegativeDepositAmountException extends InvalidDepositAmountException {
  NegativeDepositAmountException()
      : super('Deposit amount cannot be negative.');
}

void validateDepositAmount(double amount) {
  if (amount == 0) {
    throw ZeroDepositAmountException();
  } else if (amount < 0) {
    throw NegativeDepositAmountException();
  }
}

/** Question (e) Add custom exception handling to withdraw() method
- Validate withdrawal amount by throwing custom exceptions for invalid input 
👉 negative amount
👉 amount equals 0
👉 insufficient funds (amount in bank is smaller than withdrawal amount)
 */

// For insufficient funds

class ZeroWithdrawAmountException extends InvalidDepositAmountException {
  ZeroWithdrawAmountException() : super('Withdraw amount cannot be zero.');
}

class NegativeWithdrawAmountException extends InvalidDepositAmountException {
  NegativeWithdrawAmountException()
      : super('Invalid amount. Cannot apply a negative amount.');
}

class InsufficientWithdrawFundException extends InvalidDepositAmountException {
  InsufficientWithdrawFundException()
      : super('amount in bank is smaller than withdraw amount');
}

void validateWithdrawAmount(double amount, [var withdraw_amount]) {
  print("-- $withdraw_amount");
  if (withdraw_amount == 0) {
    throw ZeroWithdrawAmountException();
  } else if (withdraw_amount < 0) {
    throw NegativeWithdrawAmountException();
  } else if (withdraw_amount > amount) {
    throw InsufficientWithdrawFundException();
  }
}
