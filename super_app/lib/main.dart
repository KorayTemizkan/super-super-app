import 'package:flutter/material.dart';
import 'package:super_app/config/routes/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:super_app/injection_container.dart';

final _appRouter = AppRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _appRouter.config());
  }
}
