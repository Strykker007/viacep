import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';

abstract class IViacepDatasource {
  Future<CepModel> searchAddress(String searchText);
}
