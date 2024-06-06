import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';
import 'package:cep_aberto_app/app/modules/home/presenter/usecases/i_viacep_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../domain/errors/errors.dart';
import '../../infra/models/search_params.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final IViacepUsecase usecase;

  @observable
  SearchParams params = SearchParams(cep: '74120070');

  @observable
  CepModel address = CepModel();

  @observable
  bool isLoading = false;

  @observable
  Failure? error;

  _HomeStoreBase(this.usecase);

  @action
  void updateParams(SearchParams value) {
    params = value;
  }

  @action
  void setLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> searchAddress() async {
    setLoading(); // Ativa o estado de carregamento

    final result = await usecase(params.cep!);

    result.fold(
      (left) {
        error = left; // Guarda o erro
        address = CepModel(); // Reseta o endereço em caso de erro
      },
      (right) {
        address = right as CepModel; // Atualiza o endereço
        error = null; // Reseta o erro
      },
    );

    setLoading(); // Desativa o estado de carregamento
  }
}
