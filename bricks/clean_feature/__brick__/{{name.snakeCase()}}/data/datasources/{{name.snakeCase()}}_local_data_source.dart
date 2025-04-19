import 'dart:convert';


import '../../../../../core/errors/exceptions.dart';
import '../../../{{name.snakeCase}}/data/models/{{name.lowerCase()}}_model.dart';
class SharedPreferences{}
abstract class {{name.pascalCase()}}LocalDataSource {
  Future<void> cache{{name.pascalCase()}}({required {{name.pascalCase()}}Model? {{name.lowerCase()}}ToCache});
  Future<{{name.pascalCase()}}Model> getLast{{name.pascalCase()}}();
}

const cached{{name.pascalCase()}} = 'CACHED_TEMPLATE';

class {{name.pascalCase()}}LocalDataSourceImpl implements {{name.pascalCase()}}LocalDataSource {
  final SharedPreferences sharedPreferences;

  {{name.pascalCase()}}LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<{{name.pascalCase()}}Model> getLast{{name.pascalCase()}}() {
    final jsonString = 'sharedPreferences';

    return Future.value({{name.pascalCase()}}Model.fromJson(json: json.decode(jsonString)));
    }

  @override
  Future<void> cache{{name.pascalCase()}}({required {{name.pascalCase()}}Model? {{name.lowerCase()}}ToCache}) async {
    if ({{name.lowerCase()}}ToCache != null) {
      // sharedPreferences.setString(
      //   cached{{name.pascalCase()}},
      //   json.encode(
      //     {{name.lowerCase()}}ToCache.toJson(),
      //   ),
      // );
    } else {
      throw CacheException();
    }
  }
}
