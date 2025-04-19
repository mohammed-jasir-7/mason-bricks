import 'package:{{name}}/core/errors/failure.dart';
import 'package:{{name}}/core/params/params.dart';
import 'package:{{name}}/features/template/domain/entities/template_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TemplateRepository {
  Future<Either<Failure, TemplateEntity>> getTemplate({
    required TemplateParams templateParams,
  });
}