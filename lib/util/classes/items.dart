class Item {
  final int? id;
  final String name;
  final double remainingValue;
  final double maxValue;
  final String unit;
  final int? hikidashiId;
  final int? shoppingPlaceId;
  final int? hikidashiNum;
  final int? shoppingPlaceNum;

  const Item({
    this.id,
    required this.name,
    required this.remainingValue,
    required this.maxValue,
    required this.unit,
    this.hikidashiId,
    this.shoppingPlaceId,
    this.hikidashiNum,
    this.shoppingPlaceNum,
  });

  Item copyWith({
    int? id,
    String? name,
    double? remainingValue,
    double? maxValue,
    String? unit,
    int? hikidashiId,
    int? shoppingPlaceId,
    int? hikidashiNum,
    int? shoppingPlaceNum,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      remainingValue: remainingValue ?? this.remainingValue,
      maxValue: maxValue ?? this.maxValue,
      unit: unit ?? this.unit,
      hikidashiId: hikidashiId ?? this.hikidashiId,
      shoppingPlaceId: shoppingPlaceId ?? this.shoppingPlaceId,
      hikidashiNum: hikidashiNum ?? this.hikidashiNum,
      shoppingPlaceNum: shoppingPlaceNum ?? this.shoppingPlaceNum,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'remaining_value': remainingValue,
      'max_value': maxValue,
      'unit': unit,
      'hikidashi_id': hikidashiId,
      'shopping_place_id': shoppingPlaceId,
      'hikidashi_num': hikidashiNum,
      'shopping_place_num': shoppingPlaceNum,
    };
  }
}
