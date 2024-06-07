import 'package:dartz/dartz.dart';

import '../../domain/entities/cep_entity.dart';
import '../../domain/errors/errors.dart';
import '../../infra/models/search_params.dart';

abstract class IViacepUsecase {
  Future<Either<Failure, Cep>> call(SearchParams params);
  Future<Either<Failure, List<Cep>>> getAddressByAddress(SearchParams params);
}
