import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/model.dart';
import '../core/utils.dart' as utils;

part 'interval_event.dart';
part 'interval_state.dart';

class TimeIntervalBloc extends Bloc<TimeIntervalEvent, TimeIntervalState> {
  TimeIntervalBloc({required TimeInterval interval})
      : super(TimeIntervalInitial(interval: interval)) {
    on<UpdateTimeIntervalEvent>((event, emit) {
      final startTime = event.interval.startTime;
      final endTime = utils.getEndTime(
        startTime ?? DateTimeExtension.todayStart,
        event.interval.endTime ?? DateTimeExtension.todayMidnight,
      );
      emit(
        TimeIntervalInitial(
          interval: TimeInterval(
            startTime: startTime,
            endTime: endTime,
          ),
        ),
      );
    });
  }
}
