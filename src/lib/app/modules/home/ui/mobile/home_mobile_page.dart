import 'package:cep_aberto_app/app/modules/home/ui/desktop_web/components/loading_component.dart';
import 'package:cep_aberto_app/app/modules/home/ui/mobile/components/cep_result_search_component.dart';
import 'package:cep_aberto_app/app/modules/home/ui/mobile/components/search_address_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../presenter/controllers/home_store.dart';
import '../desktop_web/components/empty_component.dart';
import '../desktop_web/components/error_component.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({super.key});

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  late final HomeStore store;

  @override
  void initState() {
    store = Modular.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home Mobile Page',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SearchAddressMobile(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Observer(
                  builder: (context) {
                    if (store.error != null) {
                      return ErrorComponent(message: store.error!.message);
                    }
                    if (store.address.cep == null &&
                        store.addressList.isEmpty) {
                      return const EmptyComponent();
                    }
                    if (store.isLoading) {
                      return const LoadingComponent();
                    }
                    if (store.address.cep != null) {
                      return CepResultSearchComponent(
                        item: store.address,
                      );
                    }
                    if (store.filteredAddressList.isNotEmpty) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: store.filteredAddressList.length,
                        itemBuilder: (context, index) {
                          return CepResultSearchComponent(
                            item: store.filteredAddressList[index],
                          );
                        },
                      );
                    }
                    if (store.addressList.isNotEmpty) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: store.addressList.length,
                        itemBuilder: (context, index) {
                          return CepResultSearchComponent(
                            item: store.addressList[index],
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
