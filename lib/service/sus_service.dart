import 'dart:convert';

import 'package:data_visualization/model/vaccine.dart';

import 'package:http/http.dart' as http;

class SUSService {
  Future<List<Vaccine>> getVaccines() async {
    final username = 'imunizacao_public';
    final password = 'qlto5t&7r_@+#Tlstigi';
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);

    final headers = {
      "Accept": "application/json",
      "content-type": 'application/json',
      "Access-Control_Allow_Origin": "*",
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE,PATCH,OPTIONS',
      'authorization': 'Basic $encodedCredentials'
    };

    final body = {'size': '10000'};

    final url = Uri.parse('https://imunizacao-es.saude.gov.br/_search?scroll=1m');
    final response = await http.post(url, body: jsonEncode(body), headers: headers);
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      var list = (data['hits']['hits'] as List)
          .map((listVaccine) => Vaccine.vaccineFromJSON(listVaccine['_source']))
          .toList();

      // if (list.length >= 10) {
      //   list = list.take(10).toList();
      // }

      return list;
    } else {
      throw ("some error happen");
    }
  }
}
