import 'package:astrotak/data/dataproviders/relatives_dataprovider.dart';
import 'package:astrotak/data/models/relatives.dart';

class RelativesRepository {
  const RelativesRepository();

  Future<List<AllRelatives>> fetchAllRelatives() async {
    final data = await RelativesApi.getAllRelatives();

    Relatives relatives = Relatives.fromJson(data);
    return relatives.allRelatives!;
  }
}
