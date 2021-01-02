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
  final DateTime dateTime;

  CustomDateTime(this.dateTime);

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

  String get getYearString =>
      "${dateTime.year < 10 ? '0' + dateTime.year.toString() : dateTime.year}";

  String get getHourString =>
      "${dateTime.hour < 10 ? '0' + dateTime.hour.toString() : dateTime.hour}";

  String get getMinuteString =>
      "${dateTime.minute < 10 ? '0' + dateTime.minute.toString() : dateTime.minute}";

  String get getSecondString =>
      "${dateTime.second < 10 ? '0' + dateTime.second.toString() : dateTime.second}";

  String get getTimeString =>
      "${dateTime.hour > 12 ? '0' + (dateTime.hour - 12).toString() : this.getHourString}:${this.getMinuteString}:${this.getSecondString} ${dateTime.hour > 12 ? 'PM' : 'AM'}";

  String get getDateString =>
      "${this.getDayString}-${this.getMonthString}-${this.getYearString}";
}
