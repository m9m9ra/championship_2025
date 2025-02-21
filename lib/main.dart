import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:matule/core/router/router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://gflpptquvmgnfvhmswes.supabase.co';
const supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdmbHBwdHF1dm1nbmZ2aG1zd2VzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAxMjYxNjUsImV4cCI6MjA1NTcwMjE2NX0.YGlRg2iqIZFTPKpQla-YFMtsyJa8_VdQhNW1TubaHq0";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterConfigGo().router,
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        colorScheme: const ColorScheme.light(
          primary: CupertinoColors.systemTeal,
          background: Color.fromARGB(1, 247, 247, 249),
          ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        // colorScheme: const ColorScheme.light(),
        // useMaterial3: true,
      ),
    );
  }
}

extension ContextExtension on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Theme.of(this).colorScheme.error
            : Theme.of(this).snackBarTheme.backgroundColor,
      ),
    );
  }
}
