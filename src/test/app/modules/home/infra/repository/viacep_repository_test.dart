import 'package:cep_aberto_app/app/modules/home/domain/errors/errors.dart';
import 'package:cep_aberto_app/app/modules/home/infra/datasources/i_viacep_datasource.dart';
import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';
import 'package:cep_aberto_app/app/modules/home/infra/models/search_params.dart';
import 'package:cep_aberto_app/app/modules/home/infra/repository/viacep_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ViacepDatasourceMock extends Mock implements IViacepDatasource {}

class FakeSearchParams extends Fake implements SearchParams {}

void main() {
  final datasource = ViacepDatasourceMock();
  final repository = ViacepRepository(datasource);
  setUp(() {
    registerFallbackValue(FakeSearchParams());
  });
  test(
    'Deve retornar um Cep',
    () async {
      when(() => datasource.searchAddress(any())).thenAnswer(
        (_) async => CepModel(),
      );
      final SearchParams params = SearchParams(cep: '00000000');

      final result = await repository.searchAddress(params);

      expect(result, isA<Right>());
    },
  );

  test(
    'Deve retornar um GetAddressError',
    () async {
      when(() => datasource.searchAddress(any())).thenThrow(
        (_) async => GetAddressError(),
      );
      final SearchParams params = SearchParams(cep: '');

      final result = await repository.searchAddress(params);

      expect(result, isA<Left>());
    },
  );
}
