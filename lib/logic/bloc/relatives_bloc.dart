import 'package:astrotak/data/repositories/relatives_repository.dart';
import 'package:astrotak/data/models/relatives.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'relatives_event.dart';
part 'relatives_state.dart';

class RelativesBloc extends Bloc<RelativesEvent, RelativesState> {
  final RelativesRepository relativesRepository;

  RelativesBloc({required this.relativesRepository})
      : super(RelativesInitial(allRelatives: const [])) {
    on<FetchRelative>((event, emit) async {
      emit(RelativesLoading());

      final allRelatives = await relativesRepository.fetchAllRelatives();

      emit(RelativesLoaded(allRelatives: allRelatives));
    });
    on<AddRelative>((event, emit) async {
      emit(RelativesLoading());

      await relativesRepository.addRelative(event.data);

      final allRelatives = await relativesRepository.fetchAllRelatives();

      emit(RelativesLoaded(allRelatives: allRelatives));
    });
    on<DeleteRelative>((event, emit) async {
      emit(RelativesLoading());

      await relativesRepository.deleteRelative(event.uuid);

      final allRelatives = await relativesRepository.fetchAllRelatives();

      emit(RelativesLoaded(allRelatives: allRelatives));
    });
  }
}
