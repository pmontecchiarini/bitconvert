import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

final List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

final baseURL = dotenv.env['API_URL'];
final apiKey = dotenv.env['API_KEY'];

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      http.Response response = await http
          .get(Uri.parse('$baseURL/$crypto/$selectedCurrency?apikey=$apiKey'));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double rate = decodedData['rate'];
        cryptoPrices[crypto] = rate.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
