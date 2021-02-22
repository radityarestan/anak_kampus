import 'package:http/http.dart' as http;
import 'dart:convert';

class Provinsi {
  String name;

  Provinsi({this.name});

  factory Provinsi.create(Map<String, dynamic> object) {
    return Provinsi(name: object['provinsi']);
  }

  static Future<List<Provinsi>> connectToAPI() async {
    String url = 'http://anak-kampus-api.herokuapp.com/lihatprov/';

    var apiResult = await http.get(url);
    var jsonObj = jsonDecode(apiResult.body);
    List<dynamic> data = (jsonObj as Map<String, dynamic>)['result'];
    List<Provinsi> allProvinsi = [];

    for (int i = 0; i < data.length; i++) {
      allProvinsi.add(Provinsi.create(data[i]));
    }

    return allProvinsi;
  }
}
