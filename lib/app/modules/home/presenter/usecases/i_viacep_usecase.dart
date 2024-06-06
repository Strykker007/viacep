import 'package:dartz/dartz.dart';

import '../../domain/entities/cep_entity.dart';
import '../../domain/errors/errors.dart';

abstract class IViacepUsecase {
  Future<Either<Failure, Cep>> call(String cep);
}
