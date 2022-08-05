import 'package:flutter/material.dart';
import '../utilities/coin_data.dart';
import '../widgets/currency_card.dart';
import 'package:flutter/cupertino.dart';
import '../services/network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/foundation.dart';
import '../utilities/theme_data.dart';
import 'package:provider/provider.dart';

class PriceScreen extends StatefulWidget {
  static String id = 'price_screen';
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
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

    bool isDarktheme = Provider.of<ThemeChanger>(context).isDark;
    return Scaffold(
      //backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: null,
        title: Hero(
          tag: 'logo',
          child: Material(
            color: Colors.transparent,
            child: Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Icon(
                      Icons.currency_bitcoin,
                      size: 30.0,
                      color: isDarktheme ? Colors.white : Colors.black,
                    )),
                Flexible(
                  flex: 3,
                  child: Text(
                    'Bitconverter',
                    style: TextStyle(
                      fontFamily: 'KdamThmorPro',
                      fontSize: 20.0,
                      color: isDarktheme ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              makeCards(),
              isloading ? spinkit : Spacer(),
              Container(
                height: 150.0,
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 30.0),
                //Choose widget according to OS
                child: getCurrencySelectWidget(),
                // Platform.isIOS ? getCupertinoPicker() : getDropdownButton(), this code produces error on Web
              )
            ]),
      ),
    );
  }


//Choose widget according to platform
  getCurrencySelectWidget() {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return getCupertinoPicker();
    } else {
      return getDropdownButton();
    }
  }

//Android style widget
  getDropdownButton() {
    return DropdownButton<String>(
        value: selectedCurrency,
        style: const TextStyle(color: Colors.lightBlue),
        underline: Container(
          height: 2,
          color: Colors.blueGrey,
        ),
        items: currenciesList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
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

// IOS style widget
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

  Widget spinkit = SpinKitThreeBounce(
    color: Colors.blue,
    size: 30.0,
  );
}
