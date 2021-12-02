// ignore_for_file: implementation_imports

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:utils/src/repository/abs_repository.dart';

const filemanPf = "/fi/file";

class FilemanRepository extends AbsRepository {
  final String id;

  FilemanRepository({required apiGatewayURL, required this.id})
      : super(apiGatewayURL);

  Future<String> getFile(String accessToken) async {
    final response = await http.get(
      Uri.parse('$apiGatewayURL/$filemanPf/$id'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      return response.body;
      // final body =
      //     json.decode(utf8.decode(response.bodyBytes))['content'] as List;
    }
    throw Exception('Error get list file!');
  }
}
