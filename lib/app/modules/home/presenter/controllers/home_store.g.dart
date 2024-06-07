// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$paramsAtom =
      Atom(name: 'HomeStoreBase.params', context: context);

  @override
  SearchParams get params {
    _$paramsAtom.reportRead();
    return super.params;
  }

  @override
  set params(SearchParams value) {
    _$paramsAtom.reportWrite(value, super.params, () {
      super.params = value;
    });
  }

  late final _$addressAtom =
      Atom(name: 'HomeStoreBase.address', context: context);

  @override
  CepModel get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(CepModel value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$searchingByCepAtom =
      Atom(name: 'HomeStoreBase.searchingByCep', context: context);

  @override
  bool get searchingByCep {
    _$searchingByCepAtom.reportRead();
    return super.searchingByCep;
  }

  @override
  set searchingByCep(bool value) {
    _$searchingByCepAtom.reportWrite(value, super.searchingByCep, () {
      super.searchingByCep = value;
    });
  }

  late final _$addressListAtom =
      Atom(name: 'HomeStoreBase.addressList', context: context);

  @override
  List<CepModel> get addressList {
    _$addressListAtom.reportRead();
    return super.addressList;
  }

  @override
  set addressList(List<CepModel> value) {
    _$addressListAtom.reportWrite(value, super.addressList, () {
      super.addressList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$filterAtom =
      Atom(name: 'HomeStoreBase.filter', context: context);

  @override
  FilterTypeEnum get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(FilterTypeEnum value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$isAddressInvalidToSearchAtom =
      Atom(name: 'HomeStoreBase.isAddressInvalidToSearch', context: context);

  @override
  bool get isAddressInvalidToSearch {
    _$isAddressInvalidToSearchAtom.reportRead();
    return super.isAddressInvalidToSearch;
  }

  @override
  set isAddressInvalidToSearch(bool value) {
    _$isAddressInvalidToSearchAtom
        .reportWrite(value, super.isAddressInvalidToSearch, () {
      super.isAddressInvalidToSearch = value;
    });
  }

  late final _$errorAtom = Atom(name: 'HomeStoreBase.error', context: context);

  @override
  Failure? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Failure? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$searchAddressByCepAsyncAction =
      AsyncAction('HomeStoreBase.searchAddressByCep', context: context);

  @override
  Future<void> searchAddressByCep() {
    return _$searchAddressByCepAsyncAction
        .run(() => super.searchAddressByCep());
  }

  late final _$searchAddressByAddressAsyncAction =
      AsyncAction('HomeStoreBase.searchAddressByAddress', context: context);

  @override
  Future<void> searchAddressByAddress() {
    return _$searchAddressByAddressAsyncAction
        .run(() => super.searchAddressByAddress());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void updateParams(SearchParams value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.updateParams');
    try {
      return super.updateParams(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchMode() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeSearchMode');
    try {
      return super.changeSearchMode();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSearchFields() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.clearSearchFields');
    try {
      return super.clearSearchFields();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
params: ${params},
address: ${address},
searchingByCep: ${searchingByCep},
addressList: ${addressList},
isLoading: ${isLoading},
filter: ${filter},
isAddressInvalidToSearch: ${isAddressInvalidToSearch},
error: ${error}
    ''';
  }
}
