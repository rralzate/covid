import 'package:intl/intl.dart';

import 'capitalize_text.dart';

class DatesFormat {
  static String getMonthName({
    required int numberMonth,
  }) {
    String name = '';
    switch (numberMonth) {
      case 1:
        name = 'Enero';
        break;
      case 2:
        name = 'Febrero';
        break;
      case 3:
        name = 'Marzo';
        break;
      case 4:
        name = 'Abril';
        break;
      case 5:
        name = 'Mayo';
        break;
      case 6:
        name = 'Junio';
        break;
      case 7:
        name = 'Julio';
        break;
      case 8:
        name = 'Agosto';
        break;
      case 9:
        name = 'Septiembre';
        break;
      case 10:
        name = 'Octubre';
        break;
      case 11:
        name = 'Noviembre';
        break;
      default:
        name = 'Diciembre';
    }

    return name;
  }

  static String get lastDayMonth {
    var now = DateTime.now();

    DateTime beginningNextMonth = (now.month < 12)
        ? DateTime(now.year, now.month + 1, 1)
        : DateTime(now.year + 1, 1, 1);
    int lastDay = beginningNextMonth.subtract(const Duration(days: 1)).day;

    return '''Guatemala, ${lastDay.toString()} de ${DatesFormat.getMonthName(numberMonth: DateTime.now().month)} del ${DateTime.now().year.toString()}''';
  }

  static DateTime convertStringToDateTime(String datetime) {
    return DateTime.parse(datetime);
  }

  static String formatDateSimpleText(DateTime dateTime) {
    return "${capitalize(DateFormat('EEEE', 'ES').format(dateTime))}, ${DatesFormat.formatDateToShortText(dateTime)}";
  }

  static String formatSimpleDayText(String day) {
    return DateFormat('EEEE', 'ES')
        .format(DatesFormat.convertStringToDateTime(day))
        .substring(0, 3)
        .toString()
        .toLowerCase();
  }

  static String formatDateFormalText(DateTime dateTime) =>
      DateFormat("'Guatemala', d 'de' MMMM 'del' yyyy", 'es_GT')
          .format(dateTime)
          .toLowerCase();

  static String formatDateToShortText(DateTime dateTime) =>
      DateFormat('dd/MM/yyyy', 'es_GT').format(dateTime).toLowerCase();

  static String formatDateToTimeText(DateTime dateTime) =>
      DateFormat.jm().format(dateTime).toLowerCase();

  static String get todayDateFormalText =>
      DateFormat("'Guatemala', d 'de' MMMM 'del' yyyy", 'es_GT')
          .format(DateTime.now());

  static String convertDateValue(DateTime date) {
    return "${(date.day < 10) ? '0${date.day}' : (date.day)}.${(date.month < 10) ? '0${date.month}' : (date.month)}.${date.year}";
  }

  static String convertMilisecondsToDate(String time) {
    final newDate = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    return convertDateValue(newDate);
  }

  static String formatDateText(DateTime dateTime) =>
      DateFormat('dd/MM/yyyy', 'es_GT').format(dateTime);

  static String convertIntToDateTime(int yearMonthDay) {
    // Extract year, month, and day components from the integer
    int year = yearMonthDay ~/ 10000;
    int month = (yearMonthDay % 10000) ~/ 100;
    int day = yearMonthDay % 100;

    // Create a DateTime object

    return DateFormat('dd.MM.yyyy', 'es_CO').format(DateTime(year, month, day));
  }
}
