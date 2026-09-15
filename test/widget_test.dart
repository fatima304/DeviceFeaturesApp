import 'package:flutter_test/flutter_test.dart';

import 'package:device_features_app/main.dart';

void main() {
  testWidgets('Home screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const DeviceFeaturesApp());

    expect(find.text('Shopping App'), findsOneWidget);
  });
}
