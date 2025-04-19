import 'package:couple_squad/core/errors/failure.dart';
import 'package:couple_squad/core/params/params.dart';
import 'package:couple_squad/features/{{name.lowerCase()}}/domain/entities/{{name.lowerCase()}}_entity.dart';
import 'package:couple_squad/features/{{name.lowerCase()}}/domain/repositories/{{name.lowerCase()}}_repository.dart';
import 'package:dartz/dartz.dart';

class Get{{name.pascalCase()}} {
  final {{name.pascalCase()}}Repository {{name.lowerCase()}}Repository;

  Get{{name.pascalCase()}}({required this.{{name.lowerCase()}}Repository});

  Future<Either<Failure, {{name.pascalCase()}}Entity>> call({
    required {{name.pascalCase()}}Params {{name.lowerCase()}}Params,
  }) async {
    return await {{name.lowerCase()}}Repository.get{{name.pascalCase()}}({{name.lowerCase()}}Params: {{name.lowerCase()}}Params);
  }
}
