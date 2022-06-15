import 'package:flutter/material.dart';
import './price_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            
            Hero(
              tag: 'logo',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [ 
                  Icon(Icons.currency_bitcoin, size: 60.0),
                  Text('BITCONVERTER', 
                style: TextStyle( 
                    fontFamily: 'KdamThmorPro', 
                    fontSize: 40.0), 
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
              child: Text('Convert', 
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
