import 'package:astrotak/data/dataproviders/ques_category_dataprovider.dart';
import 'package:astrotak/data/models/question_category.dart';

class QuestionCategoryRepository {
  const QuestionCategoryRepository();

  Future<List<QuestionCategoryData>> fetchAllQuestionCategories() async {
    final data = await QuestionCategoryApi.fetchAllQuestionCategories();

    QuestionCategory quesCategory = QuestionCategory.fromJson(data);
    return quesCategory.data!;
  }
}
