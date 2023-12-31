import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:adviser/0_data/exceptions/exceptions.dart';
import 'package:adviser/0_data/models/advice_model.dart';

abstract interface class AdviceRemoteDataSource {
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDataSourceImpl implements AdviceRemoteDataSource {
  final http.Client client;

  const AdviceRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client
        .get(Uri.parse('https://api.flutter-community.com/api/v1/advice'));
    if (response.statusCode != 200) {
      throw ServerException();
    }
    final responseBody = json.decode(response.body);
    return AdviceModel.fromJson(responseBody);
  }
}
