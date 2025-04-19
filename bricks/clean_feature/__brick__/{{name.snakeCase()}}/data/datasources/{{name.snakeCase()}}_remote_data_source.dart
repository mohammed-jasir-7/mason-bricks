
import '../../../../../core/params/params.dart';
import '../../../{{name.snakeCase}}/data/models/{{name.lowerCase()}}_model.dart';

abstract class {{name.pascalCase()}}RemoteDataSource {
  Future<{{name.pascalCase()}}Model> get{{name.pascalCase()}}({required {{name.pascalCase()}}Params {{name.lowerCase()}}Params});
}

class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RemoteDataSource {
//  final Dio dio;

  {{name.pascalCase()}}RemoteDataSourceImpl();

  @override
  Future<{{name.pascalCase()}}Model> get{{name.pascalCase()}}({required {{name.pascalCase()}}Params {{name.lowerCase()}}Params}) async {
     final response ="jj";
    // await dio.get(
    //   'https://pokeapi.co/api/v2/pokemon/',
    //   queryParameters: {
    //     'api_key': 'if needed',
    //   },
    // );

    if (response == 200) {
      return {{name.pascalCase()}}Model.fromJson(json: response as Map<String, dynamic>);
    } else {
      throw Exception();
    }
  }
}
