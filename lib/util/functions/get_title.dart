String getTitle(String categoryType) {
  switch (categoryType) {
    case "hikidashi":
      return "収納する場所";
    case "shoppingPlace":
      return "購入する場所";
    default:
      return "";
  }
}
