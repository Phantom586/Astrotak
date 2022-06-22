import 'package:http/http.dart' as http;
import 'dart:convert';

class QuestionCategoryApi {
  static final url =
      Uri.parse('https://staging-api.astrotak.com/api/question/category/all');

  static Future<dynamic> getAllQuestionCategories() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  }
}
