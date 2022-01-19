part of 'interval_bloc.dart';

abstract class TimeIntervalEvent extends Equatable {
  const TimeIntervalEvent();

  @override
  List<Object> get props => [];
}

class UpdateTimeIntervalEvent extends TimeIntervalEvent {
  const UpdateTimeIntervalEvent({required this.interval});
  final TimeInterval interval;

  @override
  List<Object> get props => [interval];
}
