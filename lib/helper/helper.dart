class Helper {
  static String capitalizeFirstLetter(String text) {
    return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
  }
}
