// 6. Create Fruit Store Program

// Create a program (in Flutter or Dart) that keeps track of Fruit inventory using sets in Dart.

void main(List<String> args) {
  final tanko = FruitStore();
  print(tanko.findCommonFruits());
  print(tanko.findExtraFruits());
  print(tanko.addCustomerFruits());
  print(tanko.checkFruitsAvailability());

  
}

/** Question (a).  */
class FruitStore {
  // Question (b). Create a set of available fruits in the store

  Set storeFruits = {'apple', 'banana', 'kiwi', 'orange'};

  // Question(c). Create a set of fruits that the customer wants to buy

  Set wantedFruits = {'berries', 'kiwi', 'apple'};

  /** Question(d). Create a function findCommonFruits(). It returns the fruits that are both:
   * Available by the store
   * Wanted by the customer
 */

  findCommonFruits() {
    Set commonFruits = storeFruits.intersection(wantedFruits);
    return "Fruits the customer wanted to buy that are available at the store: $commonFruits";
  }

  /** Question (e). Create a function findExtraFruits() which returns
   * Extra fruits that are available in the store
   * But not wanted by the customer
   */

  findExtraFruits() {
    Set extraFruits = storeFruits.difference(wantedFruits);
    return "Fruits the customer doesn’t want to buy: $extraFruits";
  }

  /** Question(f). Create a function addCustomerFruits()
   * Add customer fruits to the available fruits set of the store and return
 */

  addCustomerFruits() {
    Set allAvailableFruits = storeFruits.union(wantedFruits);
    return "All available fruits: $allAvailableFruits";
  }

  /** Question(g). Create a function checkFruitsAvailability()
   * Check if all the fruits the customer wants to buy are available in the store
   * If available then return: 'All fruits are available'
   * Otherwise find the fruits that the customer wants to buy but are not available in the store and return: 'The following fruits are missing:

   */

  checkFruitsAvailability() {
    if (storeFruits.contains(wantedFruits)) {
      return "All fruits are available";
    } else {
      Set unavailableFruits = wantedFruits.difference(storeFruits);
      return "The following fruits are missing: $unavailableFruits";
    }
  }
}
