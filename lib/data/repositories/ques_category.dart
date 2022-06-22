import 'package:astrotak/data/dataproviders/ques_category.dart';
import 'package:astrotak/data/models/question_category.dart';

class QuestionCategoryRepository {
  const QuestionCategoryRepository();

  Future<List<QuestionCategoryData>> fetchQuestionCategories() async {
    final data = await QuestionCategoryApi.getAllQuestionCategories();

    QuestionCategory quesCategory = QuestionCategory.fromJson(data);

    final List<QuestionCategoryData>? questionCategoryDataList =
        quesCategory.data;
    return questionCategoryDataList!;
  }
}
