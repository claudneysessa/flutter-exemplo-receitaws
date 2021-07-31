import 'dart:convert';
import 'package:consumo_api_cnpj/applicatioon/commons/constantes/receitaWs.dart';
import 'package:consumo_api_cnpj/domain/entities/empresa.dart';
import 'package:http/http.dart' as http;

class ReceitaWsRepository {
  Future<Empresa> getCnpjData(String urlStr) async {
    http.Response response;
    var jsonDecode;

    response = await http.get(Uri.parse(getCNPJUrl(urlStr)));
    jsonDecode = json.decode(response.body);

    return Empresa(empresa: jsonDecode);
  }
}