import 'package:flutter_test/flutter_test.dart';
import 'package:uas_pemrograman_aplikasi_bergerak/main.dart';

void main() {
  testWidgets('Klinik Sehat app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const KlinikSehatApp());

    expect(find.text('Klinik Sehat'), findsOneWidget);
    expect(find.text('Masuk'), findsOneWidget);
  });
}
