import 'package:cep_aberto_app/app/modules/home/domain/entities/cep_entity.dart';

import 'package:cep_aberto_app/app/modules/home/domain/errors/errors.dart';
import 'package:cep_aberto_app/app/modules/home/domain/infra/repositories/i_viacep_repository.dart';

import 'package:dartz/dartz.dart';

import '../../infra/models/search_params.dart';
import '../../presenter/usecases/i_viacep_usecase.dart';

class ViacepUsecase implements IViacepUsecase {
  final IViacepRepository _repository;

  ViacepUsecase(this._repository);
  @override
  Future<Either<Failure, Cep>> call(SearchParams params) async {
    if (params.cep!.isEmpty) {
      return Left(GetAddressError(message: 'Cep Inválido'));
    }
    return await _repository.searchAddress(params);
  }

  @override
  Future<Either<Failure, List<Cep>>> getAddressByAddress(
    SearchParams params,
  ) async {
    if (params.country!.isEmpty) {
      return Left(GetAddressError(message: 'Cep Inválido'));
    }
    if (params.street!.isEmpty) {
      return Left(GetAddressError(message: 'Cep Inválido'));
    }
    if (params.city!.isEmpty) {
      return Left(GetAddressError(message: 'Cep Inválido'));
    }
    return await _repository.getAddressByAddress(params);
  }
}
