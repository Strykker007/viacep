import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';

import '../models/search_params.dart';

abstract class IViacepDatasource {
  Future<CepModel> searchAddress(SearchParams params);
  Future<List<CepModel>> getAddressByAddress(SearchParams params);
}
