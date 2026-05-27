import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart'
    as di;
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: 'TU_URL_AQUÍ', anonKey: 'TU_ANON_KEY_AQUÍ');
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'FrutiExpress Admin',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.light,
          ),
        ),
      ),
    );
  }
}
