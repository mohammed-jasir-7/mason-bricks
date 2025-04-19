import 'package:couple_squad/core/errors/failure.dart';
import 'package:couple_squad/core/params/params.dart';
import 'package:couple_squad/features/{{name.lowerCase()}}/domain/entities/{{name.lowerCase()}}_entity.dart';
import 'package:dartz/dartz.dart';

abstract class {{name.pascalCase()}}Repository {
  Future<Either<Failure, {{name.pascalCase()}}Entity>> get{{name.pascalCase()}}({
    required {{name.pascalCase()}}Params {{name.lowerCase()}}Params,
  });
}