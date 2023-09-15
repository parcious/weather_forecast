import 'package:intl/intl.dart';

class Util {
  static String appId = "ed60fcfbd110ee65c7150605ea8aceea";
  static String getFormatDate(DateTime dateTime) {
    return DateFormat("EEEE, MMM d, ''yyyy").format(dateTime);
  }
}
