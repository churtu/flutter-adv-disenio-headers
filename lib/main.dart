import 'package:adv_disenios/src/models/models.dart';
import 'package:adv_disenios/src/routes/routes.dart';
import 'package:adv_disenios/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp( const AppState() );

class AppState extends StatelessWidget {
  const AppState({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppTheme(CurrentAppTheme.dark)
        ),
        ChangeNotifierProvider(
          create: (_) => LayoutModel()
        )
      ],
      child: const DiseniosApp(),
    );
  }
}

class DiseniosApp extends StatelessWidget {
  const DiseniosApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños Adv',
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.getAppRoutes(),
      theme: appTheme.currentTheme,
    );
  }
}