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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '9DACE582-AAC5-4704-8582-B9B5AD8F6115';

class CoinData {
  

    Future getCoinData(selectedCurrency)async{
      Map<String, String> cryptoPrices = {};
      

    
    //TODO 4: Use a for loop here to loop through the cryptoList and request the data for each of them in turn.
    
    
    //TODO 5: Return a Map of the results instead of a single value.
    for (String crypto in cryptoList){
    String requestURL = '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
    Uri uri=Uri.parse(requestURL);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
  return cryptoPrices;
}
}



