import '../classes/category.dart';
import '../classes/items.dart';

// category list page
List<Category> hikidashiCategorys = [
  const Category(id: 1, name: "冷蔵庫", num: 0),
  const Category(id: 2, name: "冷凍庫", num: 1),
  const Category(id: 3, name: "野菜室", num: 2),
  const Category(id: 4, name: "調味料棚", num: 3),
  const Category(id: 5, name: "日用品", num: 4),
  const Category(id: 6, name: "その他", num: 5),
];
List<Category> shoppingPlaceCategorys = [
  const Category(id: 1, name: "業スー", num: 0),
  const Category(id: 2, name: "ベルクス", num: 1),
  const Category(id: 3, name: "オーケー", num: 2),
  const Category(id: 4, name: "セイムズ", num: 3),
  const Category(id: 5, name: "楽天市場", num: 4),
];

// item list page
const List<Item> items = [
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
