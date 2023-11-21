import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/model.dart';
import 'core/theme.dart';
import 'core/utils.dart' as utils;
import 'bloc/interval_bloc.dart';
import 'components/end_dropdown.dart';
import 'components/start_dropdown.dart';

class TimeIntervalPicker extends StatefulWidget {
  const TimeIntervalPicker({
    Key? key,
    required this.endLimit,
    required this.startLimit,
    required this.onChanged,
    this.includeMidnight = true,
    this.enabled = true,
    this.filled,
    this.fillColor,
    this.borderColor,
    this.contentPadding,
    this.borderRadius = 8,
    this.dropdownTextStyle,
    this.separatorWidget,
  }) : super(key: key);

  /// [startLimit] is the time value for [StartDropdown]
  final DateTime? startLimit;

  /// [endLimit] is the time value for [EndDropdown]
  final DateTime? endLimit;

  /// if false `Midnight` is not included in [DropdownButtonFormField]
  ///
  /// true by default
  final bool includeMidnight;

  /// if false opacity of remaining visual elements is reduced
  ///
  /// true by default
  final bool enabled;

  /// Properties of [InputDecoration]
  final bool? filled;
  final Color? fillColor;
  final EdgeInsets? contentPadding;

  /// Color of [InputDecoration.border]
  final Color? borderColor;

  /// Radius of [InputDecoration.border]
  ///
  /// defaults to 8
  final double borderRadius;

  /// TextStyle for [DropdownMenuItem]
  final TextStyle? dropdownTextStyle;

  /// Widget separating [StartDropdown] and [EndDropdown]
  final Widget? separatorWidget;

  /// Function returning
  ///
  /// [startTime] , [endTime]
  ///
  /// and [isAllDay], which is boolean depicting if the time range is complete day
  final void Function(DateTime? startTime, DateTime? endTime, bool isAllDay)
      onChanged;

  @override
  TimeIntervalPickerState createState() => TimeIntervalPickerState();
}

class TimeIntervalPickerState extends State<TimeIntervalPicker> {
  late TimeIntervalBloc bloc;

  @override
  void initState() {
    bloc = TimeIntervalBloc(
      interval: TimeInterval(
        startTime: widget.startLimit ?? DateTimeExtension.todayStart,
        endTime: widget.endLimit ?? DateTimeExtension.todayMidnight,
      ),
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant TimeIntervalPicker oldWidget) {
    if (oldWidget.startLimit != widget.startLimit ||
        oldWidget.endLimit != widget.endLimit) {
      bloc = TimeIntervalBloc(
        interval: TimeInterval(
          startTime: widget.startLimit ?? DateTimeExtension.todayStart,
          endTime: utils.getEndTime(
            widget.startLimit ?? DateTimeExtension.todayStart,
            widget.endLimit ?? DateTimeExtension.todayMidnight,
          ),
        ),
      );
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: LibTheme.theme,
      child: BlocConsumer<TimeIntervalBloc, TimeIntervalState>(
        bloc: bloc,
        listener: (context, state) {
          widget.onChanged(
            state.interval.startTime,
            state.interval.endTime,
            state.interval.allDay,
          );
        },
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: StartDropdown(
                  time: state.interval.startTime!,
                  filled: widget.filled,
                  fillColor: widget.fillColor,
                  borderColor: widget.borderColor,
                  contentPadding: widget.contentPadding,
                  enabled: widget.enabled,
                  dropdownTextStyle: widget.dropdownTextStyle,
                  onChanged: (DateTime? startTime) {
                    bloc.add(UpdateTimeIntervalEvent(
                      interval: TimeInterval(
                        startTime: startTime,
                        endTime: state.interval.endTime ??
                            DateTimeExtension.todayMidnight,
                      ),
                    ));
                  },
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              widget.separatorWidget ?? const Text('to'),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: EndDropdown(
                  time: state.interval.endTime!,
                  length: widget.includeMidnight ? 25 : 24,
                  limit: state.interval.startTime,
                  filled: widget.filled,
                  fillColor: widget.fillColor,
                  borderColor: widget.borderColor,
                  contentPadding: widget.contentPadding,
                  dropdownTextStyle: widget.dropdownTextStyle,
                  enabled: widget.enabled,
                  onChanged: (DateTime? endTime) {
                    bloc.add(UpdateTimeIntervalEvent(
                      interval: TimeInterval(
                        endTime: endTime,
                        startTime: state.interval.startTime ??
                            DateTimeExtension.todayStart,
                      ),
                    ));
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
