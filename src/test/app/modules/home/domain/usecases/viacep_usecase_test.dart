import 'package:cep_aberto_app/app/modules/home/domain/errors/errors.dart';
import 'package:cep_aberto_app/app/modules/home/domain/infra/repositories/i_viacep_repository.dart';
import 'package:cep_aberto_app/app/modules/home/domain/usecases/viacep_usecase.dart';
import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';
import 'package:cep_aberto_app/app/modules/home/infra/models/search_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ViacepRepositoryMock extends Mock implements IViacepRepository {}

class FakeSearchParams extends Fake implements SearchParams {}

void main() {
  final repository = ViacepRepositoryMock();
  final usecase = ViacepUsecase(repository);

  setUp(() {
    registerFallbackValue(FakeSearchParams());
  });

  test(
    'Deve retornar um Cep',
    () async {
      when(() => repository.searchAddress(captureAny())).thenAnswer(
        (_) async => Right(CepModel()),
      );
      final SearchParams params = SearchParams(cep: '00000000');

      final result = await usecase(params);

      expect(result, isA<Right>());
    },
  );

  test(
    'Deve retornar um Cep',
    () async {
      when(() => repository.searchAddress(captureAny())).thenThrow(
        (_) async => Left(GetAddressError()),
      );

      final SearchParams params = SearchParams(cep: '');

      final result = await usecase(params);

      expect(result, isA<Left>());
    },
  );
}
