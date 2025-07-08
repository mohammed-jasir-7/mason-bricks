import 'package:{{name}}/core/errors/failure.dart';
import 'package:{{name}}/core/params/params.dart';
import 'package:{{name}}/features/template/domain/entities/template_entity.dart';
import 'package:{{name}}/features/template/domain/repositories/template_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetTemplate {
  final TemplateRepository templateRepository;

  GetTemplate({required this.templateRepository});

  Future<Either<Failure, TemplateEntity>> call({
    required TemplateParams templateParams,
  }) async {
    return await templateRepository.getTemplate(templateParams: templateParams);
  }
}
