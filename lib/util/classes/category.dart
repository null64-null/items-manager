class Category {
  final int? id;
  final String name;
  final int? num;

  const Category({
    this.id,
    required this.name,
    this.num,
  });

  Category copyWith({
    int? id,
    String? name,
    int? num,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      num: num ?? this.num,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'num': num,
    };
  }
}
