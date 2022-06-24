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
  bool isDark = true;
  
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(isDark ? 'Dark theme' : 'Light theme'),
                  Switch(
                      value: isDark,
                      activeColor: Colors.lightBlue,
                      onChanged: (value) {
                        isDark
                            ? theme.setTheme(
                                ThemeData(),
                              )
                            : theme.setTheme(ThemeData.dark());
                        setState(() {
                          isDark = value;
                        });
                      }),
                ],
              ),
              Expanded(
                flex: 2,
                child: Hero(
                  tag: 'logo',
                  child: Material(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Flexible(
                            flex: 1,
                            child: Icon(
                              Icons.currency_bitcoin,
                              size: 60.0,
                            )),
                        Flexible(
                          flex: 3,
                          child: Text(
                            'BITCONVERTER',
                            style: TextStyle(
                              fontFamily: 'KdamThmorPro',
                              fontSize: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PriceScreen.id);
                  },
                  
                  child: Text(
                    'Convert',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
