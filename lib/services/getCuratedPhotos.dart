import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';

Future getCuratedPhotos(int Page) async {
  var url =
      Uri.parse('https://api.pexels.com/v1/curated?page=$Page&per_page=10');
  var response = await http.get(url, headers: {'Authorization': api});
  return jsonDecode(response.body);
}
//https://api.pexels.com/v1/curated?per_page=10