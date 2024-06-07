import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cep_aberto_app/app/modules/home/presenter/controllers/home_store.dart';

class FilterButtonsComponent extends StatelessWidget {
  const FilterButtonsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeStore store = Modular.get();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Observer(builder: (context) {
          return ElevatedButton(
            onPressed: () => _showFilterModal(
              context: context,
              title: 'Selecione a UF',
              items: store.uniqueUFs,
              onSelected: (selectedUF) {
                store.selectedUF = selectedUF;
                store.filterAddressListByUF(selectedUF);
              },
            ),
            child: Text(
              store.selectedUF ?? 'UF',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
          );
        }),
        const SizedBox(width: 16),
        Observer(builder: (context) {
          return ElevatedButton(
            onPressed: () => _showFilterModal(
              context: context,
              title: 'Selecione o Bairro',
              items: store.uniqueBairros,
              onSelected: (selectedLocalidade) {
                store.selectedBairro = selectedLocalidade;
                store.filterAddressListByBairro(selectedLocalidade);
              },
            ),
            child: Text(
              store.selectedBairro ?? 'Bairro',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
          );
        }),
      ],
    );
  }

  void _showFilterModal({
    required BuildContext context,
    required String title,
    required List<String> items,
    required Function(String) onSelected,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5, // Limite de altura
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              const Divider(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: items
                        .map((item) => ListTile(
                              title: Text(item),
                              onTap: () {
                                onSelected(item);
                                Navigator.pop(context);
                              },
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
