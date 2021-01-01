const List<String> monthShortNameList = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec",
];

const List<String> monthNameList = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

class CustomDateTime {
  DateTime dateTime = DateTime.now();

  DateTime get getCurrentDateTime => dateTime;

  int get getDay => dateTime.day;

  int get getMonth => dateTime.month;

  int get getYear => dateTime.year;

  int get getHour => dateTime.hour;

  int get getMinute => dateTime.minute;

  int get getSecond => dateTime.second;

  int get getMiliSecond => dateTime.millisecond;

  String get getMonthShortName => monthShortNameList[dateTime.month - 1];

  String get getMonthName => monthNameList[dateTime.month - 1];

  String get getDayString =>
      "${dateTime.day < 10 ? '0' + dateTime.day.toString() : dateTime.day}";

  String get getMonthString =>
      "${dateTime.month < 10 ? '0' + dateTime.month.toString() : dateTime.month}";
}
