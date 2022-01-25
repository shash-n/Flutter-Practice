class UList {
  int id;
  String name;
  String type;
  int totalItems;
  int totalAmount;

  UList({
    required this.id,
    required this.name,
    required this.type,
    required this.totalItems,
    required this.totalAmount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'totalItems': totalItems,
      'totalAmount': totalAmount,
    };
  }

  void fromMap(Map map) {
    id = map['id'];
    name = map['name'];
    type = map['type'];
    totalItems = map['totalItems'];
    totalAmount = map['totalAmount'];
  }

  @override
  String toString() {
    return '''UList{
      id: $id,
      name: $name, 
      type: $type, 
      totalItems: $totalItems, 
      totalAmount: $totalAmount
    }''';
  }
}

class Item {
  int id;
  String name;
  int quantity;
  int price;
  String description;
  int listId;

  Item({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.description,
    required this.listId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
      'description': description,
      'listId': listId,
    };
  }

  void fromMap(Map map) {
    id = map['id'];
    name = map['name'];
    quantity = map['quantity'];
    price = map['price'];
    description = map['description'];
    listId = map['listId'];
  }

  @override
  String toString() {
    return '''Item{
      id: $id, 
      name: $name, 
      listId: $listId
      quantity: $quantity, 
      price: $price, 
      description: $description, 
    }''';
  }
}
