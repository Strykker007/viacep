import 'dart:convert';

import 'package:cep_aberto_app/app/modules/home/data/datasource/viacep_datasource.dart';
import 'package:cep_aberto_app/app/modules/home/domain/errors/errors.dart';
import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/result.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final client = DioMock();
  final datasource = ViacepDatasource(client);
  test(
    'Deve retornar um Cep',
    () async {
      when(() => client.get(any())).thenAnswer(
        (_) async => Response(
            data: jsonDecode(searchResult),
            statusCode: 200,
            requestOptions: RequestOptions()),
      );
      final result = await datasource.searchAddress('000000000');

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
      final result = datasource.searchAddress('');

      expect(result, throwsA(isA<ServerFailure>()));
    },
  );
}
