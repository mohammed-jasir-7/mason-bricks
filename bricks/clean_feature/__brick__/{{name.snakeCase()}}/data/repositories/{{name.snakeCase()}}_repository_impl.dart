

import 'package:couple_squad/core/connection/network_info.dart';
import 'package:couple_squad/core/errors/exceptions.dart';
import 'package:couple_squad/core/errors/failure.dart';
import 'package:couple_squad/core/params/params.dart';
import 'package:couple_squad/features/{{name.lowerCase()}}/data/datasources/{{name.lowerCase()}}_local_data_source.dart';
import 'package:couple_squad/features/{{name.lowerCase()}}/data/datasources/{{name.lowerCase()}}_remote_data_source.dart';
import 'package:couple_squad/features/{{name.lowerCase()}}/data/models/{{name.lowerCase()}}_model.dart';
import 'package:couple_squad/features/{{name.lowerCase()}}/domain/repositories/{{name.lowerCase()}}_repository.dart';
import 'package:dartz/dartz.dart';

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;
  final {{name.pascalCase()}}LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  {{name.pascalCase()}}RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> get{{name.pascalCase()}}(
      {required {{name.pascalCase()}}Params {{name.lowerCase()}}Params}) async {
    if (await networkInfo.isConnected!) {
      try {
        {{name.pascalCase()}}Model remote{{name.pascalCase()}} =
            await remoteDataSource.get{{name.pascalCase()}}({{name.lowerCase()}}Params: {{name.lowerCase()}}Params);

        localDataSource.cache{{name.pascalCase()}}({{name.lowerCase()}}ToCache: remote{{name.pascalCase()}});

        return Right(remote{{name.pascalCase()}});
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      try {
        {{name.pascalCase()}}Model local{{name.pascalCase()}} = await localDataSource.getLast{{name.pascalCase()}}();
        return Right(local{{name.pascalCase()}});
      } on CacheException {
        return Left(LocalStorageFailure(errorMessage: 'This is a cache exception'));
      }
    }
  }
}
