import 'package:flutter/material.dart';
import './price_screen.dart';
import '../blocs/theme_bloc.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('Dark theme:'),
                Switch(
                    value: isDark,
                    activeColor: Colors.lightBlueAccent,
                    onChanged: (value) {
                      isDark
                          ? theme.setTheme(ThemeData())
                          : theme.setTheme(ThemeData.dark());
                      setState(() {
                        isDark = value;
                      });
                    }),
              ],
            ),
            Hero(
              tag: 'logo',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Flexible(
                      flex: 1, child: Icon(Icons.currency_bitcoin, size: 60.0)),
                  Flexible(
                    flex: 3,
                    child: Text(
                      'BITCONVERTER',
                      style:
                          TextStyle(fontFamily: 'KdamThmorPro', fontSize: 40.0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
              width: 150.0,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, PriceScreen.id);
              },
              child: Text(
                'Convert',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
