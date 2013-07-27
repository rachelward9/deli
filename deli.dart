final Map<String, int> availableItems = {
  "Tuna Salad": 450,
  "Guacamole": 375,
  "Tortilla Chips": 250,
  "Milk": 150 
};


void main() {
  print(placeOrder("Tuna Salad", 2, 1, items: availableItems));
  print(placeOrder("Guacamole", 1, 1, items: availableItems));
  print(placeOrder("Tortilla Chips", 1, 0, items: availableItems));
  print(placeOrder("Milk", 3, 1, items: availableItems));
}

String placeOrder(String item, int qty, int overnightShip, {Map<String, int> items}) {
  StringBuffer sb = new StringBuffer();
  bool onShip = overnightShip != 0;
  num overnightFee = 5;
  num standardShipFee;
  num totalShipping;
  num itemPrice = items[item]/100;
  num total = itemPrice * qty;
  String overnight = (!onShip) ? "No" : "Yes (Additional \$5.00)";
  String shipping = (total <= 10.00) ? ("\$2.00") : ("\$3:00");
  
  
//  Calculating shipping price (without overnight fee)
  if (total <= 10.00) {
    standardShipFee = 2;
  }
  else {
    standardShipFee = 3;
  }
  
//  Calculating shipping price with overnight fee
  if (onShip) {
    totalShipping = standardShipFee + overnightFee;
  }
  else {
    totalShipping = standardShipFee;
  }
  
  num finalTotal = total + totalShipping;
  
  sb.writeln("Item: $item");
  sb.writeln("Item Price: \$${itemPrice.toStringAsFixed(2)}");
  sb.writeln("Quantity: $qty");
  sb.writeln("Total: ${total.toStringAsFixed(2)}");
  sb.writeln("Shipping Fee: ${standardShipFee.toStringAsFixed(2)}");
  sb.writeln("Overnight Shipping: $overnight");
//  If the user wants over night shipping, show a calculated shipping total, otherwise, skip this line of text
  if (onShip) {
  sb.writeln("Total Shipping: ${totalShipping.toStringAsFixed(2)}");
  }
  sb.writeln("Final Total: ${finalTotal.toStringAsFixed(2)}");
  
  return sb.toString();
}