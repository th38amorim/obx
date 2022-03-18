import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:obx_com_br_app/domain/model/i_address_repository.dart';
import 'package:obx_com_br_app/domain/model/user.dart';

class AddressRepository implements IAddressRepository {

  @override
  Future<User?> getCepData(String cep) async {
    final Uri url = Uri.parse('https://cep.alphacode.com.br/action/cep/' + cep);
    final client = new http.Client();
    final response = await client.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    final responseBody = json.decode(response.body);
    if(responseBody['success'] != null) {
      Map<String, dynamic> data = responseBody['success'];
      return User.empty().copyWith(
        state: data['uf'].toUpperCase(),
        city: data['cidade'],
        street: data['tp_logradouro'] + ' ' +data['logradouro'],
        district: data['bairro'],
      );
    }
    return null;
  }

}
