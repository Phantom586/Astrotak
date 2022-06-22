import 'package:http/http.dart' as http;
import 'dart:convert';

class QuestionCategoryApi {
  static final url =
      Uri.parse('https://staging-api.astrotak.com/api/question/category/all');

  static Future<dynamic> getAllQuestionCategories() async {
    var response = await http.get(url, headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ'
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  }
}
