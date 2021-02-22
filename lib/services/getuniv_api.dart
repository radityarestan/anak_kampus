import 'package:http/http.dart' as http;
import 'dart:convert';

class Universitas {
  String name;
  String province;

  Universitas({this.name, this.province});

  factory Universitas.createUniv(Map<String, dynamic> object) {
    return Universitas(name: object['nama'], province: object['provinsi']);
  }

  static Future<List<Universitas>> connectToAPI() async {
    String url = 'http://anak-kampus-api.herokuapp.com/lihatuniv/';

    var apiResult = await http.get(url);
    var jsonObj = jsonDecode(apiResult.body);
    List<dynamic> data = (jsonObj as Map<String, dynamic>)['result'];
    List<Universitas> allUniversity = [];

    for (int i = 0; i < data.length; i++) {
      allUniversity.add(Universitas.createUniv(data[i]));
    }

    return allUniversity;
  }
}
