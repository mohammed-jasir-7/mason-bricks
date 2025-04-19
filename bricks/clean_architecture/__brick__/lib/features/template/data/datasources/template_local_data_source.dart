import 'dart:convert';

import 'package:{{name}}/core/errors/exceptions.dart';
import '../models/template_model.dart';
class SharedPreferences{}
abstract class TemplateLocalDataSource {
  Future<void> cacheTemplate({required TemplateModel? templateToCache});
  Future<TemplateModel> getLastTemplate();
}

const cachedTemplate = 'CACHED_TEMPLATE';

class TemplateLocalDataSourceImpl implements TemplateLocalDataSource {
  final SharedPreferences sharedPreferences;

  TemplateLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<TemplateModel> getLastTemplate() {
    final jsonString = 'sharedPreferences';

    return Future.value(TemplateModel.fromJson(json: json.decode(jsonString)));
    }

  @override
  Future<void> cacheTemplate({required TemplateModel? templateToCache}) async {
    if (templateToCache != null) {
      // sharedPreferences.setString(
      //   cachedTemplate,
      //   json.encode(
      //     templateToCache.toJson(),
      //   ),
      // );
    } else {
      throw CacheException();
    }
  }
}
