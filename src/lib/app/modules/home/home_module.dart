import 'package:cep_aberto_app/app/modules/home/data/datasource/viacep_datasource.dart';
import 'package:cep_aberto_app/app/modules/home/domain/infra/repositories/i_viacep_repository.dart';
import 'package:cep_aberto_app/app/modules/home/domain/usecases/viacep_usecase.dart';
import 'package:cep_aberto_app/app/modules/home/infra/datasources/i_viacep_datasource.dart';
import 'package:cep_aberto_app/app/modules/home/infra/repository/viacep_repository.dart';
import 'package:cep_aberto_app/app/modules/home/presenter/controllers/home_store.dart';
import 'package:cep_aberto_app/app/modules/home/presenter/usecases/i_viacep_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ui/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance(
      Dio(),
    );
    i.addLazySingleton<IViacepDatasource>(ViacepDatasource.new);
    i.addLazySingleton<IViacepRepository>(ViacepRepository.new);
    i.addLazySingleton<IViacepUsecase>(ViacepUsecase.new);
    i.addLazySingleton(HomeStore.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.add(
      ChildRoute(
        Modular.initialRoute,
        child: (args) => const HomePage(),
      ),
    );
    super.routes(r);
  }
}
