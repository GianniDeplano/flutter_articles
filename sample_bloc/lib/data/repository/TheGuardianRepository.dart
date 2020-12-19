import 'package:sample_bloc/data/models/listapi.dart';
import 'package:sample_bloc/data/repository/TheGuardianClient.dart';

class TheGuardianRepository {
  TheGuardianClient client;

  static const apikey = "7065e1fa-88eb-4abc-972e-2e0aaa986fac";

  TheGuardianRepository() {
    client = TheGuardianClient(apikey);
  }

  Future<List<SearchApiItemModel>> getItems(String query) async {
    return await client.getItems(query);
  }
}
