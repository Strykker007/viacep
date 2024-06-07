// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cep_aberto_app/app/modules/home/presenter/controllers/home_store.dart';
import '../../../../../core/utils/masks.dart';

class SearchAddressMobile extends StatefulWidget {
  const SearchAddressMobile({
    super.key,
  });

  @override
  State<SearchAddressMobile> createState() => _SearchAddressMobileState();
}

class _SearchAddressMobileState extends State<SearchAddressMobile> {
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Observer(
                  builder: (context) => store.searchingByCep
                      ? TextField(
                          controller: cepController,
                          keyboardType: TextInputType.number,
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
                        )
                      : Column(
                          children: [
                            TextField(
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
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
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
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
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
                            const SizedBox(
                              height: 10,
                            ),
                            Observer(
                              builder: (context) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: store.isAddressInvalidToSearch ||
                                                store.isLoading
                                            ? null
                                            : () {
                                                store.searchAddressByAddress();
                                              },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color:
                                                store.isAddressInvalidToSearch
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                        .withOpacity(0.3)
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Buscar',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      );
                    },
                  ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
