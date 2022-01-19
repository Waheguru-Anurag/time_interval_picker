# time_interval_picker

A Custom Time Interval Select Dropdown for getting a Time Range.
<br>
<br>
<p align="center">
    <img src="https://user-images.githubusercontent.com/54813606/150069276-79795b83-b6fd-49bb-92be-5a6737525e2e.gif" width=200 height=400>
</p>

## Installation

<h3> 1. Depend On It </h3>

Add this to `pubspec.yaml` file

```yaml
    dependencies:
        time_interval_picker: ^[latest_version]
```

<h3> 2. Install it </h3>

Run the following command in shell

```shell
    flutter pub get
```

<h3> 3. Import It </h3>

Import the package in your Dart Code

```dart
    import 'package:time_interval_picker/time_interval_picker.dart';    
```

## Base Usage

```dart
    TimeIntervalPicker(
        endLimit: null,
        startLimit: null,
        onChanged: (DateTime? startTime, DateTime? endTime, bool isAllDay) {},
    ),
```
