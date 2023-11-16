import 'dart:io';

class ShoppingCart {
  Map<String, int> items = {};

  void addItem(String itemName, int quantity) {
    items.update(itemName, (existingQuantity) => existingQuantity + quantity,
        ifAbsent: () => quantity);
  }

  // void removeItem(String itemName, int quantity) {
  //   if (items.containsKey(itemName)) {
  //     items[itemName] = (items[itemName]! - quantity).clamp(0, items[itemName]!);
  //     if (items[itemName] == 0) {
  //       items.remove(itemName);
  //     }
  //   } else {
  //     print("Item $itemName not found in the cart.");
  //   }
  // }

  void displayCart() {
    print("\nShopping Cart:");
    items.forEach((itemName, quantity) {
      print("$itemName: $quantity");
    });
    print("    ");
  }
}

class AccountDetails {
  String? firstname;
  String? lastname;
  var othername;
  var username;
  int? age;
  var password;
  int? choice;
  var item1 = "milo";
  var item2 = "sugar";
  var item3 = "nido";

 
  void displayAccount() {
    print("       ");
    print("Firstname is $firstname");
    print("Lastname is $lastname");
    print("Othername is $othername");
    print("Your age is $age");
    print("Username is $username");
    print("Your fullname is $firstname $othername $lastname");
  }
}

class Wallet {
  Map<String, int> amount = {};

  void addItem(String currencyName, int quantity) {
    amount.update(
        currencyName, (existingQuantity) => existingQuantity + quantity,
        ifAbsent: () => quantity);
  }

  // void removeItem(String itemName, int quantity) {
  //   if (items.containsKey(itemName)) {
  //     items[itemName] = (items[itemName]! - quantity).clamp(0, items[itemName]!);
  //     if (items[itemName] == 0) {
  //       items.remove(itemName);
  //     }
  //   } else {
  //     print("Item $itemName not found in the cart.");
  //   }
  // }

  void displayWallet() {
    print("Wallet Amount ");
    amount.forEach((currencyName, quantity) {
      print("$currencyName: $quantity");
    });
    print("      ");
  }
}

void main() {
  ShoppingCart cart = ShoppingCart();
  Wallet wallet = Wallet();
  AccountDetails ad = AccountDetails();


  print("      ");
  print("enter your firstname: ");
  ad.firstname = stdin.readLineSync();
  print("enter your lastname: ");
  ad.lastname = stdin.readLineSync();
  print("enter your othername: ");
  ad.othername = stdin.readLineSync();
  print("enter your age: ");
  ad.age = int.parse(stdin.readLineSync()!);
  print("enter your Username: ");
  ad.username = stdin.readLineSync();
  print("enter your password: ");
  ad.password = stdin.readLineSync();

  if (ad.password == "Qwerty1234") {
    print("accepted ");
  } else {
    print("invalid. Restart process ");
    exit(0);
  }

  Map<int, String> itemSelector = {
    1: "Milo",
    2: "Sugar",
    3: "Nido",
  };
  Map<int, String> amountSelector = {
    1: "add amount",
    2: "view balance",
    3: "Back",
  };

  while (true) {
    print("   ");
    print("Welcome to our Shopping Cart");
    print("         ");
    print("1. Add Item to Cart");
    // print("2. Remove Item from Cart");
    print("2. View Cart");
    print("3. Check Wallet");
    print("4. View account details");
    print("5. Exit");

    stdout.write("Enter your choice: ");
    var choice = int.tryParse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        print("    ");
        print("Select an item to add:");
        itemSelector.forEach((key, value) {
          print("$key. $value");
        });

        stdout.write("Enter item number: ");
        var itemNumber = int.tryParse(stdin.readLineSync()!);

        if (itemNumber != null && itemSelector.containsKey(itemNumber)) {
          stdout.write("Enter quantity: ");
          var quantity = int.tryParse(stdin.readLineSync()!);
          if (quantity != null) {
            cart.addItem(itemSelector[itemNumber]!, quantity);
            print("$quantity ${itemSelector[itemNumber]} added to the cart.");
          } else {
            print("Invalid quantity. Please enter a valid number.");
          }
        }
        break;

      // case 2:
      //   stdout.write("Enter item name to remove: ");
      //   var itemName = stdin.readLineSync();
      //   stdout.write("Enter quantity to remove: ");
      //   var quantity = int.tryParse(stdin.readLineSync()!);
      //   if (quantity != null) {
      //     cart.removeItem(itemName!, quantity);
      //     print("$quantity $itemName removed from the cart.");
      //   } else {
      //     print("Invalid quantity. Please enter a valid number.");
      //   }
      //   break;

      case 2:
        cart.displayCart();
        break;

      case 3:
        print("    ");
        print("ACCOUNT DETAILS");
        print("1. Add Amount");
        print("2. View Balance");
        print("3. Back");

        stdout.write("Enter your choice: ");
        var choice = int.tryParse(stdin.readLineSync()!);
        switch (choice) {
          case 1:
            print("   ");
            print("Amount to add:");
            amountSelector.forEach((key, value) {
              print("$key. $value");
            });

            print("Enter amount to add ");
            var amount = int.tryParse(stdin.readLineSync()!);

            if (amount != null && amountSelector.containsKey(amount)) {
              stdout.write("Enter Amount: ");
              var quantity = int.tryParse(stdin.readLineSync()!);
              if (quantity != null) {
                cart.addItem(amountSelector[amount]!, quantity);
                print(
                    "$quantity ${amountSelector[amount]} added to your Wallet.");
              } else {
                print("Invalid amount. Please enter a valid amount.");
              }
            }
            break;
          case 2:
            wallet.displayWallet();
            break;
          case 3:
            print("Exiting Wallet");
            exit(0);

          default:
            print("Invalid code. please enter a number from 1 to 3");
        }

      case 4:
        ad.displayAccount();
      case 5:
        print("Exiting. Thank you for using the shopping cart!");
        exit(0);

      default:
        print("Invalid choice. Please enter a number from 1 to 5.");
    }
  }
}
