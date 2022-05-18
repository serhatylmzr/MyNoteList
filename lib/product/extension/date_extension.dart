import 'package:easy_localization/easy_localization.dart';

extension DateExtension on DateTime? {
  DateFormat get _monthDayFormat => DateFormat(DateFormat.ABBR_MONTH_DAY);

  String get timetoString {
    if (this is DateTime) {
      return _monthDayFormat.format(this!);
    } else {
      return '';
    }
  }
}
