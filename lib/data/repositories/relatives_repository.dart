import 'package:astrotak/data/dataproviders/relatives_dataprovider.dart';
import 'package:astrotak/data/models/relatives.dart';

class RelativesRepository {
  const RelativesRepository();

  Future<List<AllRelatives>> fetchAllRelatives() async {
    final data = await RelativesApi.fetchAllRelatives();

    Relatives relatives = Relatives.fromJson(data);
    return relatives.allRelatives!;
  }

  Future<bool> addRelative(Map<String, dynamic> data) async {
    final resp = await RelativesApi.addRelative(data);

    return resp["success"];
  }

  Future<void> deleteRelative(String uuid) async {
    final resp = await RelativesApi.deleteRelative(uuid);
  }
}
