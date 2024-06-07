import 'package:cep_aberto_app/app/core/enums/filter_type_enum.dart';
import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';
import 'package:cep_aberto_app/app/modules/home/presenter/usecases/i_viacep_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../domain/errors/errors.dart';
import '../../infra/models/search_params.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final IViacepUsecase usecase;

  @observable
  SearchParams params = SearchParams();

  @observable
  CepModel address = CepModel();

  @observable
  bool searchingByCep = true;

  @observable
  List<CepModel> addressList = List.empty(growable: true);

  @observable
  bool isLoading = false;

  @observable
  FilterTypeEnum filter = FilterTypeEnum.uf;

  @observable
  bool isAddressInvalidToSearch = true;

  @observable
  Failure? error;

  HomeStoreBase(this.usecase);

  @action
  void updateParams(SearchParams value) {
    params = value;
  }

  void validateFields() {
    isAddressInvalidToSearch = params.city == null ||
        params.city!.isEmpty ||
        params.country == null ||
        params.country!.isEmpty ||
        params.street == null ||
        params.street!.isEmpty;
  }

  @action
  void changeSearchMode() {
    params = SearchParams();
    searchingByCep = !searchingByCep;
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  Future<void> searchAddressByCep() async {
    setLoading(true); // Ativa o estado de carregamento

    final result = await usecase(params);

    result.fold(
      (left) {
        error = left;
        address = CepModel();
      },
      (right) {
        addressList = [];
        address = right as CepModel;
        error = null;
      },
    );

    setLoading(false);
  }

  @action
  void clearSearchFields() {
    address = CepModel();
    addressList = [];
  }

  @action
  Future<void> searchAddressByAddress() async {
    setLoading(true); // Ativa o estado de carregamento

    final result = await usecase.getAddressByAddress(params);

    result.fold(
      (left) {
        error = left;
        address = CepModel();
      },
      (right) {
        address = CepModel();
        addressList = right as List<CepModel>;
        error = null;
      },
    );

    setLoading(false);
  }
}
