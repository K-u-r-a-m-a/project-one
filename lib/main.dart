import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/notifiers.dart';
import 'package:flutter_application_1/views/pages/start_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://tsdrsqonffyftmcdfymw.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRzZHJzcW9uZmZ5ZnRtY2RmeW13Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzAyMDYxMTcsImV4cCI6MjA4NTc4MjExN30.vqgssNZVB9O31SRyrmsXI_7sa030NHJgM_QW8PnXZEw',
  );
  
  runApp(const MyApp());
}
final supabase = Supabase.instance.client;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 26, 239, 235),
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: const StartPage(),
        );
      },
    );
  }
}
