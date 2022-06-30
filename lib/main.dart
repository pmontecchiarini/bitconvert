import 'package:bitconvert/screens/price_screen.dart';
import 'package:bitconvert/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'utilities/theme_data.dart';

Future main() async {
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChanger(ThemeData.dark()),
      builder: (context, child) {
        return MaterialAppWithTheme();
      },
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        title: 'Bitconverter',
        theme: theme.getTheme(),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: ((context) => WelcomeScreen()),
          PriceScreen.id: ((context) => PriceScreen()),
        });
  }
}
