import '../ui/templates/categories_page_template.dart';
import '../ui/templates/items_list_page_template.dart';

// category list page
List<ButtonItem> hikidashiButtonItems = [
  const ButtonItem(id: 1, name: "冷蔵庫", notifications: 1),
  const ButtonItem(id: 2, name: "冷凍庫", notifications: 0),
  const ButtonItem(id: 3, name: "野菜室", notifications: 0),
  const ButtonItem(id: 4, name: "調味料棚", notifications: 2),
  const ButtonItem(id: 5, name: "日用品", notifications: 2),
  const ButtonItem(id: 6, name: "その他", notifications: 1),
];
List<ButtonItem> shoppingPlaceButtonItems = [
  const ButtonItem(id: 1, name: "業スー", notifications: 1),
  const ButtonItem(id: 2, name: "ベルクス", notifications: 0),
  const ButtonItem(id: 3, name: "オーケー", notifications: 2),
  const ButtonItem(id: 4, name: "セイムズ", notifications: 2),
  const ButtonItem(id: 5, name: "楽天市場", notifications: 0),
];

// item list page
List<ItemStatusItem> statusItems = [
  const ItemStatusItem(
    id: 1,
    itemName: "にんじん",
    remainingValue: 1,
    maxValue: 5,
    unit: "本",
  ),
  const ItemStatusItem(
    id: 2,
    itemName: "キャベツ",
    remainingValue: 0.5,
    maxValue: 1,
    unit: "個",
  ),
  const ItemStatusItem(
    id: 3,
    itemName: "豆腐",
    remainingValue: 2,
    maxValue: 4,
    unit: "個",
  ),
  const ItemStatusItem(
    id: 4,
    itemName: "納豆",
    remainingValue: 2,
    maxValue: 12,
    unit: "パック",
  ),
  const ItemStatusItem(
    id: 5,
    itemName: "小松菜",
    remainingValue: 0.2,
    maxValue: 1,
    unit: "袋",
  ),
  const ItemStatusItem(
    id: 6,
    itemName: "なす",
    remainingValue: 3,
    maxValue: 5,
    unit: "本",
  ),
];
