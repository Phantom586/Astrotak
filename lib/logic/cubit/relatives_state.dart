part of 'relatives_cubit.dart';

@immutable
abstract class RelativesState {}

class RelativesInitial extends RelativesState {
  final List<AllRelatives> allRelatives;

  RelativesInitial({required this.allRelatives});
}

class RelativesLoading extends RelativesState {}

class RelativesLoaded extends RelativesState {
  final List<AllRelatives> allRelatives;

  RelativesLoaded({required this.allRelatives});
}
