import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../presenter/controllers/home_store.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Mobile Page'),
      ),
      body: Container(
        child: Column(
          children: [
            Observer(
              builder: (_) {
                if (store.isLoading) {
                  return const CircularProgressIndicator();
                } else if (store.error != null) {
                  return Text('Error: ${store.error.toString()}');
                } else {
                  return Text('CEP: ${store.address.cep}');
                }
              },
            ),
            IconButton(
              onPressed: () async {
                store.searchAddress();
              },
              icon: const Icon(Icons.abc_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
