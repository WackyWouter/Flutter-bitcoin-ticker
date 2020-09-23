import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
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

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '7FE6D833-B6E0-43F7-923A-9E4447312DEC';

class CoinData {
  Future<Map> getCoinData(String currency) async {
    Map<String, String> cryptoRates = {};
    for (String crypto in cryptoList) {
      http.Response response = await http.get(
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$currency?apikey=$apiKey');

      if (response.statusCode == 200) {
        double rate = jsonDecode(response.body)['rate'];
        cryptoRates[crypto] = rate.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw ('Problem with the get request');
      }
    }
    return cryptoRates;
  }
}
