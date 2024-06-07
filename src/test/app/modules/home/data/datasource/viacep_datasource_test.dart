import 'dart:convert';

import 'package:cep_aberto_app/app/modules/home/data/datasource/viacep_datasource.dart';
import 'package:cep_aberto_app/app/modules/home/domain/errors/errors.dart';
import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';
import 'package:cep_aberto_app/app/modules/home/infra/models/search_params.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/result.dart';

class DioMock extends Mock implements Dio {}

class FakeSearchParams extends Fake implements SearchParams {}

void main() {
  final client = DioMock();
  final datasource = ViacepDatasource(client);

  setUp(() {
    registerFallbackValue(FakeSearchParams());
  });
  test(
    'Deve retornar um Cep',
    () async {
      when(() => client.get(any())).thenAnswer(
        (_) async => Response(
            data: jsonDecode(searchResult),
            statusCode: 200,
            requestOptions: RequestOptions()),
      );
      final params = SearchParams(cep: '00000000');
      final result = await datasource.searchAddress(params);

      expect(result, isA<CepModel>());
    },
  );

  test(
    'Deve retornar um Erro se o código da resposta não for 200',
    () async {
      when(() => client.get(any())).thenAnswer(
        (_) async => Response(
          statusCode: 401,
          requestOptions: RequestOptions(),
          data: null,
        ),
      );
      final params = SearchParams(cep: '');

      final result = datasource.searchAddress(params);

      expect(result, throwsA(isA<ServerFailure>()));
    },
  );
}
