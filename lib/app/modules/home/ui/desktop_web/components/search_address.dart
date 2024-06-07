// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep_aberto_app/app/modules/home/infra/models/search_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:cep_aberto_app/app/modules/home/presenter/controllers/home_store.dart';

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
            mainAxisSize: MainAxisSize.min,
            children: [
              Observer(
                builder: (context) => store.searchingByCep
                    ? Expanded(
                        child: TextField(
                          controller: cepController,
                          onChanged: (value) {
                            setState(() {
                              store.params.cep = value;
                              store.updateParams(store.params);
                            });
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
                                  onPressed: () {
                                    store.searchAddressByCep();
                                  },
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
                                onChanged: (value) {
                                  store.params.country = value;
                                  store.updateParams(store.params);
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
                                onChanged: (value) {
                                  store.params.city = value;
                                  store.updateParams(store.params);
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
                                onChanged: (value) {
                                  store.params.street = value;
                                  store.updateParams(store.params);
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              onPressed: () {
                                store.searchAddressByAddress();
                              },
                              icon: const Icon(Icons.search),
                            ),
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
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
