import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'page/login_page.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFFF5F5F1),
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const KlinikSehatApp());
}

class KlinikSehatApp extends StatelessWidget {
  const KlinikSehatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klinik Sehat',
      debugShowCheckedModeBanner: false,
      theme: KlinikTheme.buildTheme(),
      home: const LoginPage(),
    );
  }
}
