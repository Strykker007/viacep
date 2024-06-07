import 'package:cep_aberto_app/app/modules/home/domain/errors/errors.dart';
import 'package:cep_aberto_app/app/modules/home/infra/datasources/i_viacep_datasource.dart';

import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';

import 'package:dartz/dartz.dart';

import '../../domain/infra/repositories/i_viacep_repository.dart';
import '../models/search_params.dart';

class ViacepRepository implements IViacepRepository {
  final IViacepDatasource _datasource;

  ViacepRepository(this._datasource);
  @override
  Future<Either<Failure, CepModel>> searchAddress(SearchParams params) async {
    try {
      final cepModel = await _datasource.searchAddress(params);
      return Right(cepModel);
    } catch (e) {
      return Left(GetAddressError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CepModel>>> getAddressByAddress(
    SearchParams params,
  ) async {
    try {
      final cepModelList = await _datasource.getAddressByAddress(params);
      return Right(cepModelList);
    } catch (e) {
      return Left(GetAddressError(message: e.toString()));
    }
  }
}
