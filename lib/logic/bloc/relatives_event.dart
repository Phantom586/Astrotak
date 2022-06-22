part of 'relatives_bloc.dart';

@immutable
abstract class RelativesEvent {}

class FetchRelative extends RelativesEvent {}

class AddRelative extends RelativesEvent {
  final Map<String, dynamic> data;

  AddRelative({required this.data});
}

class UpdateRelative extends RelativesEvent {}

class DeleteRelative extends RelativesEvent {
  final String uuid;

  DeleteRelative({required this.uuid});
}
