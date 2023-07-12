import 'package:intl/intl.dart';

String convertDateToString<DateTime>(date) =>
    DateFormat.Md().add_jm().format(date);
