String getTitle(String categoryType) {
  switch (categoryType) {
    case "hikidashi":
      return "おうちのひきだし";
    case "shoppingPlace":
      return "かいものリスト";
    default:
      return "";
  }
}
