import 'package:cep_aberto_app/app/modules/home/presenter/controllers/home_store.dart';
import 'package:cep_aberto_app/app/modules/home/ui/desktop_web/components/data_table_component.dart';
import 'package:cep_aberto_app/app/modules/home/ui/desktop_web/components/empty_component.dart';
import 'package:cep_aberto_app/app/modules/home/ui/desktop_web/components/error_component.dart';
import 'package:cep_aberto_app/app/modules/home/ui/desktop_web/components/loading_component.dart';
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
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: SearchAddress(),
              ),
              const SizedBox(height: 20),
              Observer(
                builder: (context) {
                  if (store.error != null) {
                    return ErrorComponent(message: store.error!.message);
                  }
                  if (store.address.cep == null && store.addressList.isEmpty) {
                    return const EmptyComponent();
                  }
                  if (store.isLoading) {
                    return const LoadingComponent();
                  }
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
