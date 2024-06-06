import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';
import 'package:dartz/dartz.dart';

import '../../errors/errors.dart';

abstract class IViacepRepository {
  Future<Either<Failure, CepModel>> searchAddress(String cep);
}