part of 'interval_bloc.dart';

abstract class TimeIntervalState extends Equatable {
  const TimeIntervalState({required this.interval});
  final TimeInterval interval;

  @override
  List<Object> get props => [interval];
}

class TimeIntervalInitial extends TimeIntervalState {
  const TimeIntervalInitial({required TimeInterval interval})
      : super(interval: interval);
}
