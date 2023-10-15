import 'package:device_preview/device_preview.dart';
import 'package:example/theme/app_color.dart';
import 'package:example/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:scroll_datetime_picker/scroll_datetime_picker.dart';

void main() {
  initializeDateFormatting('en');

  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: AppTheme.themeData,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime date = DateTime.now();
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Scroll DateTime Picker'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(height: 20),

            /* DATE */
            ScrollDateTimePicker(
              itemExtent: 54,
              onChange: (datetime) => setState(() {
                date = datetime;
              }),
              dateOption: DateTimePickerOption(
                dateFormat: DateFormat(
                  'EddMMMy',
                  DevicePreview.locale(context)?.languageCode,
                ),
                minDate: DateTime(2000, 6),
                maxDate: DateTime(2024, 6),
                initialDate: date,
              ),
              wheelOption: const DateTimePickerWheelOption(
                offAxisFraction: 1.25,
                perspective: 0.01,
                squeeze: 1.2,
              ),
              style: DateTimePickerStyle(
                centerDecoration: BoxDecoration(
                  color: AppColor.secondary,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 3),
                ),
                activeStyle: TextStyle(
                  fontSize: 24,
                  letterSpacing: -0.5,
                  color: Theme.of(context).primaryColor,
                ),
                inactiveStyle: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor.withOpacity(0.7),
                ),
                disabledStyle: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ),
            const SizedBox(height: 20),

            /* TIME */
            ScrollDateTimePicker(
              itemExtent: 54,
              infiniteScroll: true,
              dateOption: DateTimePickerOption(
                dateFormat: DateFormat(
                  'hhmmss a',
                  DevicePreview.locale(context)?.languageCode,
                ),
                minDate: DateTime(2000, 6),
                maxDate: DateTime(2024, 6),
                initialDate: time,
              ),
              onChange: (datetime) => setState(() {
                time = datetime;
              }),
              style: DateTimePickerStyle(
                centerDecoration: const BoxDecoration(
                  color: AppColor.primary,
                  border: Border(
                    top: BorderSide(width: 3),
                    bottom: BorderSide(width: 3),
                  ),
                ),
                activeStyle: const TextStyle(
                  fontSize: 28,
                  letterSpacing: -0.5,
                  color: AppColor.secondary,
                ),
                inactiveStyle: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor.withOpacity(0.7),
                ),
                disabledStyle: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ),
            const SizedBox(height: 20),

            /* Active Date */
            Text(
              DateFormat(
                'EEEE dd MMMM yyyy',
                DevicePreview.locale(context)?.languageCode,
              ).format(date),
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            Text(
              DateFormat(
                'HH:mm:ss',
                DevicePreview.locale(context)?.languageCode,
              ).format(time),
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
