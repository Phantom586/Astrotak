part of 'question_category_cubit.dart';

@immutable
abstract class QuestionCategoryState {}

class QuestionCategoryInitial extends QuestionCategoryState {
  final List<QuestionCategoryData?> questionCategoryDataList;

  QuestionCategoryInitial({required this.questionCategoryDataList});
}

class QuestionCategoryLoading extends QuestionCategoryState {}

class QuestionCategoryLoaded extends QuestionCategoryState {
  final List<QuestionCategoryData> questionCategoryDataList;

  QuestionCategoryLoaded({required this.questionCategoryDataList});
}
