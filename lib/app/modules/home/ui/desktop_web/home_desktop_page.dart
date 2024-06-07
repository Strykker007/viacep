import 'package:cep_aberto_app/app/modules/home/presenter/controllers/home_store.dart';
import 'package:cep_aberto_app/app/modules/home/ui/desktop_web/components/data_table_component.dart';
import 'package:cep_aberto_app/app/modules/home/ui/desktop_web/components/search_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeDesktopPage extends StatefulWidget {
  const HomeDesktopPage({super.key});

  @override
  State<HomeDesktopPage> createState() => _HomeDesktopPageState();
}

class _HomeDesktopPageState extends State<HomeDesktopPage> {
  final HomeStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Via Cep App',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchAddress(),
              const SizedBox(
                height: 20,
              ),
              Observer(
                builder: (context) {
                  if (store.isLoading) return const CircularProgressIndicator();
                  return const DataTableComponent();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
