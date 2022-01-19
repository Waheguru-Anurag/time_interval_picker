import 'utils.dart';

class TimeInterval {
  TimeInterval({
    this.startTime,
    this.endTime,
  });

  final DateTime? startTime;
  final DateTime? endTime;

  TimeInterval copyWith({
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return TimeInterval(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  String toString() => 'TimeInterval(startTime: $startTime, endTime: $endTime)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TimeInterval &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode => startTime.hashCode ^ endTime.hashCode;

  bool get allDay => checkAllDay(startTime, endTime);
}

extension DateTimeExtension on DateTime {
  static DateTime get todayMidnight {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, 23, 59, 59);
  }

  static DateTime get todayStart {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, 0, 0, 0);
  }
}
