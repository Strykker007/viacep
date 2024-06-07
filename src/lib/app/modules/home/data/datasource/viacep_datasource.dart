import 'package:cep_aberto_app/app/modules/home/domain/errors/errors.dart';
import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';

import 'package:dio/dio.dart';

import '../../infra/datasources/i_viacep_datasource.dart';
import '../../infra/models/search_params.dart';

class ViacepDatasource implements IViacepDatasource {
  final Dio _client;

  ViacepDatasource(this._client);
  @override
  Future<CepModel> searchAddress(SearchParams params) async {
    final result = await _client.get(
      'https://viacep.com.br/ws/${params.cep!}/json',
    );
    if (result.statusCode == 200) {
      return CepModel.fromJson(result.data);
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<List<CepModel>> getAddressByAddress(SearchParams params) async {
    final List<CepModel> cepModelList = List.empty(growable: true);
    final result = await _client.get(
      'https://viacep.com.br/ws/${params.country!}/${params.city!}/${params.street!}/json',
    );
    if (result.statusCode == 200) {
      result.data.forEach((element) {
        cepModelList.add(CepModel.fromJson(element));
      });
      return cepModelList;
    } else {
      throw ServerFailure();
    }
  }
}
