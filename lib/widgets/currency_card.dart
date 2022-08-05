import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    Key? key,
    required this.value,
    required this.selectedCurrency,
    required this.cryptoCurrency,
  }) : super(key: key);

  final String value;
  final String selectedCurrency;
  final String cryptoCurrency;


  @override
  Widget build(BuildContext context) {
  
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [Colors.grey, Color.fromARGB(255, 110, 127, 135)]),
        ),
        child: Column(
          children: [
            Text(
              "1 $cryptoCurrency = $value $selectedCurrency",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
