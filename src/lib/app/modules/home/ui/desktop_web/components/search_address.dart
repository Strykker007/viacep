// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cep_aberto_app/app/modules/home/presenter/controllers/home_store.dart';
import '../../../../../core/utils/masks.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({
    super.key,
  });

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  late final HomeStore store;

  final TextEditingController cepController = TextEditingController();
  final TextEditingController ufController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();

  @override
  void initState() {
    store = Modular.get<HomeStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 6,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Observer(
                builder: (context) => store.searchingByCep
                    ? Expanded(
                        child: TextField(
                          controller: cepController,
                          onChanged: (value) {
                            setState(
                              () {
                                store.params.cep = value.replaceAll(
                                  RegExp(r'[^\d]'),
                                  '',
                                );
                                store.updateParams(store.params);
                              },
                            );
                          },
                          inputFormatters: [
                            Masks.generateMask(
                              '##.###-###',
                              initialText: cepController.text,
                            ),
                          ],
                          textInputAction: TextInputAction.done,
                          onSubmitted:
                              cepController.text.isEmpty || store.isLoading
                                  ? null
                                  : (value) {
                                      store.searchAddressByCep();
                                    },
                          decoration: InputDecoration(
                            hintText: 'Digite o cep aqui',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            suffixIcon: Observer(
                              builder: (context) {
                                return IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    color: cepController.text.isEmpty
                                        ? Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.3)
                                        : Theme.of(context).colorScheme.primary,
                                  ),
                                  onPressed: cepController.text.isNotEmpty ||
                                          store.isLoading
                                      ? () {
                                          store.searchAddressByCep();
                                        }
                                      : null,
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: ufController,
                                decoration: InputDecoration(
                                  hintText: 'UF',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                textInputAction: TextInputAction.done,
                                onSubmitted: store.isAddressInvalidToSearch ||
                                        store.isLoading
                                    ? null
                                    : (value) {
                                        store.searchAddressByAddress();
                                      },
                                onChanged: (value) {
                                  store.params.country = value;
                                  store.updateParams(store.params);
                                  store.validateFields();
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                controller: cityController,
                                decoration: InputDecoration(
                                  hintText: 'Cidade',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                textInputAction: TextInputAction.done,
                                onSubmitted: store.isAddressInvalidToSearch ||
                                        store.isLoading
                                    ? null
                                    : (value) {
                                        store.searchAddressByAddress();
                                      },
                                onChanged: (value) {
                                  store.params.city = value;
                                  store.updateParams(store.params);
                                  store.validateFields();
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                controller: streetController,
                                decoration: InputDecoration(
                                  hintText: 'Logradouro',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                textInputAction: TextInputAction.done,
                                onSubmitted: store.isAddressInvalidToSearch ||
                                        store.isLoading
                                    ? null
                                    : (value) {
                                        store.searchAddressByAddress();
                                      },
                                onChanged: (value) {
                                  store.params.street = value;
                                  store.updateParams(store.params);
                                  store.validateFields();
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Observer(builder: (context) {
                              return IconButton(
                                onPressed: store.isAddressInvalidToSearch ||
                                        store.isLoading
                                    ? null
                                    : () {
                                        store.searchAddressByAddress();
                                      },
                                icon: Icon(
                                  Icons.search,
                                  color: store.isAddressInvalidToSearch
                                      ? Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.3)
                                      : Theme.of(context).colorScheme.primary,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
              ),
              const SizedBox(
                width: 10,
              ),
              Observer(
                builder: (context) {
                  return TextButton(
                    onPressed: () {
                      store.changeSearchMode();
                    },
                    child: Text(
                      store.searchingByCep
                          ? 'Não sei meu cep'
                          : 'Pesquisar por CEP',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  );
                },
              ),
              Observer(
                builder: (context) {
                  return Visibility(
                    visible: store.uniqueUFs.isNotEmpty,
                    child: DropdownButton<String>(
                      hint: const Text("Selecione UF"),
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      value: store.selectedUF,
                      onChanged: (String? newValue) {
                        store.selectedUF = newValue;
                        store.filterAddressListByUF(newValue);
                      },
                      items: store.uniqueUFs
                          .map<DropdownMenuItem<String>>((String uf) {
                        return DropdownMenuItem<String>(
                          value: uf,
                          child: Text(uf),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              const SizedBox(width: 10),
              Observer(
                builder: (context) {
                  return Visibility(
                    visible: store.uniqueBairros.isNotEmpty,
                    child: DropdownButton<String>(
                      hint: const Text("Selecione Localidade"),
                      value: store.selectedBairro,
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      onChanged: (String? newValue) {
                        store.selectedBairro = newValue;
                        store.filterAddressListByBairro(newValue);
                      },
                      items: store.uniqueBairros.map<DropdownMenuItem<String>>(
                        (String localidade) {
                          return DropdownMenuItem<String>(
                            value: localidade,
                            child: Text(localidade),
                          );
                        },
                      ).toList(),
                    ),
                  );
                },
              ),
              const SizedBox(width: 10),
              Observer(
                builder: (context) {
                  return Visibility(
                    visible: store.address.cep != null ||
                        store.addressList.isNotEmpty,
                    child: GestureDetector(
                      onTap: () {
                        cepController.clear();
                        ufController.clear();
                        cityController.clear();
                        streetController.clear();
                        store.clearSearchFields();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Text(
                          'Limpar busca',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
