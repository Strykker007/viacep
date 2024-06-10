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
  ObservableList<CepModel> addressList = ObservableList<CepModel>();

  @observable
  ObservableList<CepModel> filteredAddressList = ObservableList<CepModel>();

  @observable
  bool isLoading = false;

  @observable
  bool isAddressInvalidToSearch = true;

  @observable
  Failure? error;

  @observable
  ObservableList<String> uniqueBairros = ObservableList<String>();

  @observable
  ObservableList<String> uniqueUFs = ObservableList<String>();

  @observable
  String? selectedBairro;

  @observable
  String? selectedUF;

  HomeStoreBase(this.usecase) {
    reaction((_) => addressList, (_) {
      _extractUniqueValues();
    });
  }

  void _extractUniqueValues() {
    final Set<String> bairros = {};
    final Set<String> ufs = {};
    for (final cepModel in addressList) {
      if (cepModel.bairro != null) {
        bairros.add(cepModel.bairro!);
      }
      if (cepModel.uf != null) {
        ufs.add(cepModel.uf!);
      }
    }
    uniqueBairros = ObservableList<String>.of(bairros);
    uniqueUFs = ObservableList<String>.of(ufs);
    filteredAddressList = ObservableList<CepModel>.of(addressList);
  }

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
    setLoading(true);

    final result = await usecase(params);

    result.fold(
      (left) {
        error = left;
        address = CepModel();
      },
      (right) {
        address = right as CepModel;
        error = null;
      },
    );

    setLoading(false);
  }

  @action
  void clearSearchFields() {
    address = CepModel();
    addressList = ObservableList();
    filteredAddressList = ObservableList();
    uniqueBairros = ObservableList();
    uniqueUFs = ObservableList();
    selectedBairro = null;
    selectedUF = null;
  }

  @action
  Future<void> searchAddressByAddress() async {
    setLoading(true);

    final result = await usecase.getAddressByAddress(params);

    result.fold(
      (left) {
        error = left;
        address = CepModel();
      },
      (right) {
        address = CepModel();
        addressList = ObservableList<CepModel>.of(right as List<CepModel>);
        error = null;
      },
    );

    setLoading(false);
  }

  @action
  void filterAddressListByBairro(String? bairro) {
    if (bairro != null && bairro.isNotEmpty) {
      filteredAddressList = ObservableList<CepModel>.of(
        addressList.where((address) => address.bairro == bairro).toList(),
      );
    } else {
      filteredAddressList = ObservableList<CepModel>.of(addressList);
    }
  }

  @action
  void filterAddressListByUF(String? uf) {
    if (uf != null && uf.isNotEmpty) {
      filteredAddressList = ObservableList<CepModel>.of(
        addressList.where((address) => address.uf == uf).toList(),
      );
    } else {
      filteredAddressList = ObservableList<CepModel>.of(addressList);
    }
  }
}
