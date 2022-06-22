import 'package:http/http.dart' as http;
import 'dart:convert';

class RelativesApi {
  static const baseUrl = "https://staging-api.astrotak.com/api/relative";

  static var headers = {
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVHlwZSI6IlVTRVIiLCJ1dWlkIjoiYWVmODk1MDAtZDBmZS0xMWVjLWFhMWYtZGZjNDA3OWQ1YzhkIiwiaXNFbWFpbFZlcmlmaWVkIjp0cnVlLCJwaG9uZU51bWJlciI6Ijk3MTExODExOTgiLCJlbWFpbCI6Im1hbmF2Z2FyZzI3MkBnbWFpbC5jb20iLCJtYXNrZWRFbWFpbCI6Im1hbioqKioqKioqKmdtYWlsLmNvbSIsImV4aXN0aW5nVXNlciI6dHJ1ZSwiaWF0IjoxNjU0NzUyMzkyLCJleHAiOjE2NzQ3NTIzOTJ9.DxkKgpPadS8bn4dlDKXAH1Xrrs95mS2Z6dmngsAKBW8"
  };

  static Future<dynamic> fetchAllRelatives() async {
    var url = Uri.parse('$baseUrl/all');
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var allRelatives = data["data"];
      return allRelatives;
    }
  }

  static Future<dynamic> addRelative(Map<String, dynamic> data) async {
    var url = Uri.parse(baseUrl);
    var body = jsonEncode(data);
    print("JsonEncoded Body: $body");
    var response = await http.post(url, headers: headers, body: body);
    print("Response from AddRelative ${response.body}");

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else if (response.statusCode == 500) {
      var data = jsonDecode(response.body);
      return data;
    }
  }

  static Future<dynamic> updateRelative(
      String? uuid, Map<String, dynamic> data) async {
    var url = Uri.parse('$baseUrl/update/$uuid');
    var body = jsonEncode(data);
    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  }

  static Future<dynamic> deleteRelative(String? uuid) async {
    var url = Uri.parse('$baseUrl/delete/$uuid');
    var response = await http.post(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  }
}
