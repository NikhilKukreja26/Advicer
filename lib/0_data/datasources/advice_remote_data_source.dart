import 'dart:convert';

import 'package:adviser/0_data/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract interface class AdviceRemoteDataSource {
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDataSourceImpl implements AdviceRemoteDataSource {
  final client = http.Client();
  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client
        .get(Uri.parse('https://api.flutter-community.com/api/v1/advice'));
    final responseBody = json.decode(response.body);
    return AdviceModel.fromJson(responseBody);
  }
}
