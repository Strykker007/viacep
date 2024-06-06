import 'package:cep_aberto_app/app/modules/home/domain/errors/errors.dart';
import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';

import 'package:dio/dio.dart';

import '../../infra/datasources/i_viacep_datasource.dart';

class ViacepDatasource implements IViacepDatasource {
  final Dio _client;

  ViacepDatasource(this._client);
  @override
  Future<CepModel> searchAddress(String searchText) async {
    final result = await _client.get(
      'https://viacep.com.br/ws/$searchText/json',
    );
    if (result.statusCode == 200) {
      return CepModel.fromJson(result.data);
    } else {
      throw ServerFailure();
    }
  }
}
