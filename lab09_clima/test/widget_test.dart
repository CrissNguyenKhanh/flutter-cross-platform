import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab09_clima/screens/location_screen.dart';

void main() {
  testWidgets('Weather screen displays supplied weather data', (tester) async {
    final fakeWeather = <String, dynamic>{
      'main': {'temp': 27.4},
      'weather': [
        {'id': 800},
      ],
      'name': 'Da Nang',
    };

    await tester.pumpWidget(
      MaterialApp(home: LocationScreen(initialWeatherData: fakeWeather)),
    );

    expect(find.text('CLIMA'), findsOneWidget);

    expect(find.text('27°'), findsOneWidget);

    expect(find.text('Da Nang'), findsOneWidget);

    expect(find.text('☀️'), findsOneWidget);
  });
}
