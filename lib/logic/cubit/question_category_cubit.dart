import 'package:astrotak/data/repositories/ques_category_repository.dart';
import 'package:astrotak/data/models/question_category.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'question_category_state.dart';

class QuestionCategoryCubit extends Cubit<QuestionCategoryState> {
  final QuestionCategoryRepository quesCategoryRepository;

  QuestionCategoryCubit({required this.quesCategoryRepository})
      : super(QuestionCategoryInitial(questionCategoryDataList: const []));

  Future fetchAllQuestionCategories() async {
    emit(QuestionCategoryLoading());

    final questionCategories =
        await quesCategoryRepository.fetchAllQuestionCategories();

    emit(QuestionCategoryLoaded(questionCategoryDataList: questionCategories));
  }
}
