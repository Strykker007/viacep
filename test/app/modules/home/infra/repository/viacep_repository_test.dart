import 'package:cep_aberto_app/app/modules/home/domain/errors/errors.dart';
import 'package:cep_aberto_app/app/modules/home/infra/datasources/i_viacep_datasource.dart';
import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';
import 'package:cep_aberto_app/app/modules/home/infra/repository/viacep_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ViacepDatasourceMock extends Mock implements IViacepDatasource {}

void main() {
  final datasource = ViacepDatasourceMock();
  final repository = ViacepRepository(datasource);
  test(
    'Deve retornar um Cep',
    () async {
      when(() => datasource.searchAddress(any())).thenAnswer(
        (_) async => CepModel(),
      );
      final result = await repository.searchAddress('000000000');

      expect(result, isA<Right>());
    },
  );

  test(
    'Deve retornar um GetAddressError',
    () async {
      when(() => datasource.searchAddress(any())).thenThrow(
        (_) async => GetAddressError(),
      );
      final result = await repository.searchAddress('');

      expect(result, isA<Left>());
    },
  );
}
