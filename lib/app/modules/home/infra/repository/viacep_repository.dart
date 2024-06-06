import 'package:cep_aberto_app/app/modules/home/domain/errors/errors.dart';
import 'package:cep_aberto_app/app/modules/home/infra/datasources/i_viacep_datasource.dart';

import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';

import 'package:dartz/dartz.dart';

import '../../domain/infra/repositories/i_viacep_repository.dart';

class ViacepRepository implements IViacepRepository {
  final IViacepDatasource _datasource;

  ViacepRepository(this._datasource);
  @override
  Future<Either<Failure, CepModel>> searchAddress(String searchText) async {
    try {
      final cepModel = await _datasource.searchAddress(searchText);
      return Right(cepModel);
    } catch (e) {
      return Left(GetAddressError(message: e.toString()));
    }
  }
}
