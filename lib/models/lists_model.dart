class UList {
  String name;
  String type;
  int totalItems;
  int totalAmount;

  UList({
    required this.name,
    required this.type,
    required this.totalItems,
    required this.totalAmount,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'totalItems': totalItems,
      'totalAmount': totalAmount,
    };
  }

  void fromMap(Map map) {
    name = map['name'];
    type = map['type'];
    totalItems = map['totalItems'];
    totalAmount = map['totalAmount'];
  }

  @override
  String toString() {
    return '''UList{
      name: $name, 
      type: $type, 
      totalItems: $totalItems, 
      totalAmount: $totalAmount
    }''';
  }
}

class Item {
  String name;
  int quantity;
  int price;
  String description;

  Item({
    required this.name,
    required this.quantity,
    required this.price,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'description': description,
    };
  }

  void fromMap(Map map) {
    name = map['name'];
    quantity = map['quantity'];
    price = map['price'];
    description = map['description'];
  }

  @override
  String toString() {
    return '''Item{
      name: $name, 
      quantity: $quantity, 
      price: $price, 
      description: $description
    }''';
  }
}

class ListItemRelation {
  final int id;
  final int itemId;
  final int listId;
  final int itemQuantity;

  ListItemRelation({
    required this.id,
    required this.itemId,
    required this.listId,
    required this.itemQuantity,
  });
}
