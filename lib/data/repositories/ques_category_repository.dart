import 'package:astrotak/data/dataproviders/ques_category_dataprovider.dart';
import 'package:astrotak/data/models/question_category.dart';

class QuestionCategoryRepository {
  const QuestionCategoryRepository();

  Future<List<QuestionCategoryData>> fetchQuestionCategories() async {
    final data = await QuestionCategoryApi.getAllQuestionCategories();

    QuestionCategory quesCategory = QuestionCategory.fromJson(data);
    return quesCategory.data!;
  }
}
