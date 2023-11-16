import '../classes/category.dart';
import '../classes/items.dart';

// category list page
List<Category> hikidashiCategorys = [
  const Category(id: 1, name: "冷蔵庫", notifications: 1),
  const Category(id: 2, name: "冷凍庫", notifications: 0),
  const Category(id: 3, name: "野菜室", notifications: 0),
  const Category(id: 4, name: "調味料棚", notifications: 2),
  const Category(id: 5, name: "日用品", notifications: 2),
  const Category(id: 6, name: "その他", notifications: 1),
];
List<Category> shoppingPlaceCategorys = [
  const Category(id: 1, name: "業スー", notifications: 1),
  const Category(id: 2, name: "ベルクス", notifications: 0),
  const Category(id: 3, name: "オーケー", notifications: 2),
  const Category(id: 4, name: "セイムズ", notifications: 2),
  const Category(id: 5, name: "楽天市場", notifications: 0),
];

// item list page
List<Item> items = [
  Item(
    id: 1,
    name: "にんじん",
    remainingValue: 1,
    maxValue: 5,
    unit: "本",
  ),
  Item(
    id: 2,
    name: "キャベツ",
    remainingValue: 0.5,
    maxValue: 1,
    unit: "個",
  ),
  Item(
    id: 3,
    name: "豆腐",
    remainingValue: 2,
    maxValue: 4,
    unit: "個",
  ),
  Item(
    id: 4,
    name: "納豆",
    remainingValue: 2,
    maxValue: 12,
    unit: "パック",
  ),
  Item(
    id: 5,
    name: "小松菜",
    remainingValue: 0.2,
    maxValue: 1,
    unit: "袋",
  ),
  Item(
    id: 6,
    name: "なす",
    remainingValue: 3,
    maxValue: 5,
    unit: "本",
  ),
];
