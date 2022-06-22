import 'package:astrotak/data/repositories/relatives_repository.dart';
import 'package:astrotak/data/models/relatives.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'relatives_state.dart';

class RelativesCubit extends Cubit<RelativesState> {
  final RelativesRepository relativesRepository;

  RelativesCubit({required this.relativesRepository})
      : super(RelativesInitial(allRelatives: const []));

  Future getRelatives() async {
    emit(RelativesLoading());

    final allRelatives = await relativesRepository.fetchAllRelatives();
    print(allRelatives.toString());
    emit(RelativesLoaded(allRelatives: allRelatives));
  }
}
