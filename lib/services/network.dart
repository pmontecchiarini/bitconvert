import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../utilities/coin_data.dart';

final baseURL = dotenv.env['API_URL'];
final apiKey = dotenv.env['API_KEY'];

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      http.Response response = await http.get(Uri.parse(
          '$baseURL/exchangerate/$crypto/$selectedCurrency?apikey=$apiKey'));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double rate = decodedData['rate'];
        cryptoPrices[crypto] = rate.toStringAsFixed(0);
      } else {
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
