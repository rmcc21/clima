import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  late final Uri uri;
  NetworkHelper(this.uri);

  Future getData() async {
    Response response = await get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
