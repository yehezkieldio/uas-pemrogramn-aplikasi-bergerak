import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'page/login_page.dart';
import 'design_system.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: DesignSystem.zenWhite,
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
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: DesignSystem.zenWhite,
        colorScheme: ColorScheme.fromSeed(
          seedColor: DesignSystem.primary,
          surface: DesignSystem.zenWhite,
        ),
        fontFamily: DesignSystem.bodyMedium.fontFamily,
      ),
      home: const LoginPage(),
    );
  }
}
