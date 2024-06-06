import 'package:cep_aberto_app/app/modules/home/domain/errors/errors.dart';
import 'package:cep_aberto_app/app/modules/home/domain/infra/repositories/i_viacep_repository.dart';
import 'package:cep_aberto_app/app/modules/home/domain/usecases/viacep_usecase.dart';
import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ViacepRepositoryMock extends Mock implements IViacepRepository {}

void main() {
  final repository = ViacepRepositoryMock();
  final usecase = ViacepUsecase(repository);
  test(
    'Deve retornar um Cep',
    () async {
      when(() => repository.searchAddress(any())).thenAnswer(
        (_) async => Right(CepModel()),
      );
      final result = await usecase('000000000');

      expect(result, isA<Right>());
    },
  );

  test(
    'Deve retornar um Cep',
    () async {
      when(() => repository.searchAddress(any())).thenThrow(
        (_) async => Left(GetAddressError()),
      );
      final result = await usecase('');

      expect(result, isA<Left>());
    },
  );
}
