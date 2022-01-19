import 'package:intl/intl.dart';

import 'model.dart';

DateTime getDateTimeFromIndex(int index, {DateTime? startTime}) {
  int start = 0;
  if (startTime != null) {
    start = getIndexFromDateTime(startTime);
  }

  index = index + start;

  final int hours = index % 24;

  final DateTime now = DateTime.now();
  if (index == 24) {
    return DateTimeExtension.todayMidnight;
  }
  final DateTime dateTime = DateTime(now.year, now.month, now.day, hours, 0);
  return dateTime;
}

int getIndexFromDateTime(DateTime time) {
  if (time.hour == 23 && time.minute == 59) {
    return 24;
  } else {
    return time.hour;
  }
}

bool compare(DateTime time, DateTime limit, bool greaterThan) {
  if (greaterThan) {
    if (time.hour == limit.hour) {
      return time.minute > limit.minute;
    } else {
      return time.hour > limit.hour;
    }
  } else {
    if (time.hour == limit.hour) {
      return time.minute != limit.minute;
    } else {
      return time.hour != limit.hour;
    }
  }
}

bool checkAllDay(DateTime? startTime, DateTime? endTime) {
  if (startTime == null && endTime == null) {
    return true;
  } else if ((startTime == null && endTime != null) ||
      (endTime == null && startTime != null)) {
    return false;
  } else {
    if (startTime!.hour == 0 && endTime!.hour == 23 && endTime.minute == 59) {
      return true;
    } else {
      return false;
    }
  }
}

String getTimeRange(DateTime? startTime, DateTime? endTime, DateFormat format) {
  startTime = startTime ?? DateTimeExtension.todayStart;
  endTime = endTime ?? DateTimeExtension.todayMidnight;

  String start = format.format(startTime);
  String end = format.format(endTime);

  return '$start-$end';
}

DateTime getEndTime(DateTime startTime, DateTime endTime) {
  if (startTime.hour.compareTo(endTime.hour) > 0) {
    if (startTime.hour < 23) {
      endTime = startTime.add(const Duration(hours: 1));
    } else {
      endTime = DateTimeExtension.todayMidnight;
    }
  } else if (startTime.hour.compareTo(endTime.hour) < 0) {
    endTime = endTime;
  } else {
    if (endTime.minute == startTime.minute) {
      if (startTime.hour < 23) {
        endTime = startTime.add(const Duration(hours: 1));
      } else {
        endTime = DateTimeExtension.todayMidnight;
      }
    }
  }
  return endTime;
}

List<DateTime> getDateTimeList(int length, {DateTime? startTime}) {
  return List<DateTime>.generate(length, (index) {
    final DateTime time = getDateTimeFromIndex(
      index,
    );
    return time;
  }).where((time) {
    return startTime == null || compare(time, startTime, true);
  }).toList();
}
