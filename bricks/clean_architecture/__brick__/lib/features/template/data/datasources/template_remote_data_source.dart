
import '../models/template_model.dart';
import 'package:{{name}}/core/params/params.dart';
import 'package:injectable/injectable.dart';
abstract class TemplateRemoteDataSource {
  Future<TemplateModel> getTemplate({required TemplateParams templateParams});
}
 
 @Injectable(as: TemplateRemoteDataSource)
class TemplateRemoteDataSourceImpl implements TemplateRemoteDataSource {
//  final Dio dio;

  TemplateRemoteDataSourceImpl();

  @override
  Future<TemplateModel> getTemplate({required TemplateParams templateParams}) async {
     final response ="jj";
    // await dio.get(
    //   'https://pokeapi.co/api/v2/pokemon/',
    //   queryParameters: {
    //     'api_key': 'if needed',
    //   },
    // );

    if (response == 200) {
      return TemplateModel.fromJson(json: response as Map<String, dynamic>);
    } else {
      throw Exception();
    }
  }
}
