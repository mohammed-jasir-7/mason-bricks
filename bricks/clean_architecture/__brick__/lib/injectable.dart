import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:{{name}}/injectable.config.dart';

import 'package:get_it/get_it.dart';

import 'package:injectable/injectable.dart';

import 'core/api/api.dart';
import 'core/api/api_request_queue.dart';
import 'core/api/api_client.dart';

final getIt = GetIt.instance;
@InjectableInit()
configureDependencies(String env) async {
  getIt.registerFactory<Connectivity>(() => Connectivity());
  //getIt.registerSingleton<FilePicker>(FilePicker.platform);

  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  getIt.registerLazySingleton<ApiQueue>(() => ApiQueueImpl());

  if (env == "dev") {
    //getIt.registerFactory<Endpoints>(() => Endpoints(baseUrl: "http://192.168.1.2:5000/"));
    getIt.registerFactory<Endpoints>(
      () => Endpoints(baseUrl: "https://9fde-42-104-129-92.ngrok-free.app/"),
    );
  } else if (env == "prod") {
    getIt.registerFactory<Endpoints>(
      () => Endpoints(baseUrl: "https://api-v2.couplesquad.com/"),
    );
  } else if (env == "test") {
    getIt.registerFactory<Endpoints>(
      () => Endpoints(baseUrl: "https://demoapi-v2.couplesquad.com/"),
    );
  }

  getIt.init(environment: env);
}
