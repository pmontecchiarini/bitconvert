import 'package:flutter/material.dart';
import '../coin_data.dart';
import '../currency_card.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  static String id = 'price_screen';
  
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  String selectedCurrency = 'USD';

  Map<String, String> coinValues = {};
  bool isloading = false;

  void getData() async {
    isloading = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isloading = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  Column makeCards() {
    List<CurrencyCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CurrencyCard(
          cryptoCurrency: crypto,
          selectedCurrency: selectedCurrency,
          value: isloading ? '?' : coinValues[crypto]!,
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: null,
        title: Hero(
          tag: 'logo',
          child: Row(
            children: const [
              Flexible(
                  flex: 1, child: Icon(Icons.currency_bitcoin, size: 20.0)),
              Flexible(
                flex: 3,
                child: Text(
                  'Bitconverter',
                  style: TextStyle(fontFamily: 'KdamThmorPro', fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            makeCards(),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              //Choose widget according to OS
              child:
                  Platform.isIOS ? getCupertinoPicker() : getDropdownButton(),
            )
          ]),
    );
  }

  getDropdownButton() {
    return DropdownButton<String>(
        value: selectedCurrency,
        style: const TextStyle(color: Colors.lightGreen),
        underline: Container(
          height: 2,
          color: Colors.lightGreenAccent,
        ),
        // ignore: prefer_const_literals_to_create_immutables
        items: currenciesList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Monserrat',
              ),
            ),
            
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedCurrency = value!;
            getData();
          });
        });
  }

  getCupertinoPicker() {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData();
        });
      },
      children: currenciesList.map((String value) {
        return Text(value);
      }).toList(),
    );
  }
}

