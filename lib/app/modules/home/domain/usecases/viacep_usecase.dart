import 'package:cep_aberto_app/app/modules/home/domain/entities/cep_entity.dart';

import 'package:cep_aberto_app/app/modules/home/domain/errors/errors.dart';
import 'package:cep_aberto_app/app/modules/home/domain/infra/repositories/i_viacep_repository.dart';

import 'package:dartz/dartz.dart';

import '../../presenter/usecases/i_viacep_usecase.dart';

class ViacepUsecase implements IViacepUsecase {
  final IViacepRepository _repository;

  ViacepUsecase(this._repository);
  @override
  Future<Either<Failure, Cep>> call(String cep) async {
    if (cep.isEmpty) {
      return Left(GetAddressError(message: 'Cep Inválido'));
    }
    return await _repository.searchAddress(cep);
  }
}
