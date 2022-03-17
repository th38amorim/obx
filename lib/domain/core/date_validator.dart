class DateValidator {

  static bool isValid(String input) {
    List<String> data = input.split('/');
    if(int.parse(data[1]) > 12) {
      return false;
    }
    return isDate(data[2] + '-' + data[1] +  '-' + data[0]);
  }

  /// check if the string is a date
  static bool isDate(String str) {
    try {
      DateTime.parse(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// check if the string is a date that's after the specified date
  ///
  /// If `date` is not passed, it defaults to now.
  static bool isAfter(String str, [date]) {
    if (date == null) {
      date = new DateTime.now();
    } else if (isDate(date)) {
      date = DateTime.parse(date);
    } else {
      return false;
    }

    DateTime strDate;
    try {
      strDate = DateTime.parse(str);
    } catch (e) {
      return false;
    }

    return strDate.isAfter(date);
  }

  /// check if the string is a date that's before the specified date
  ///
  /// If `date` is not passed, it defaults to now.
  static bool isBefore(String str, [date]) {
    if (date == null) {
      date = new DateTime.now();
    } else if (isDate(date)) {
      date = DateTime.parse(date);
    } else {
      return false;
    }

    DateTime strDate;
    try {
      strDate = DateTime.parse(str);
    } catch (e) {
      return false;
    }

    return strDate.isBefore(date);
  }
}
