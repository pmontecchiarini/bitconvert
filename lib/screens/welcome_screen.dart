import 'package:flutter/material.dart';
import './price_screen.dart';
import '../utilities/theme_data.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDarktheme = Provider.of<ThemeChanger>(context).isDark;
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
                  Text(isDarktheme ? 'Dark theme' : 'Light theme'),
                  Switch(
                      value: isDarktheme,
                      activeColor: Colors.lightBlue,
                      onChanged: (value) {
                        if (!isDarktheme) {
                          theme.setTheme(ThemeData.dark());
                        } else {
                          theme.setTheme(ThemeData()
                              //Apply theme customization to the complete theme
                              // .copyWith(
                              //     scaffoldBackgroundColor:
                              //         Color.fromARGB(255, 228, 228, 228))
                              );
                        }
                        setState(() {
                          isDarktheme = value;
                        });
                      }),
                ],
              ),
              Expanded(
                flex: 2,
                child: Hero(
                  tag: 'logo',
                  child: Material(
                    //color: Color.fromARGB(255, 228, 228, 228),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Flexible(
                            flex: 1,
                            child: Icon(Icons.currency_bitcoin, size: 60.0)),
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
