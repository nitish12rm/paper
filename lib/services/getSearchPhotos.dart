import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';

Future getSearchPhotos(String search, int page) async {
  var uri =
      'https://api.pexels.com/v1/search?query=$search&page=$page&per_page=10';
  var url = Uri.parse(uri);
  var response = await http.get(url, headers: {'Authorization': api});
  return jsonDecode(response.body);
}
