

import 'package:{{name}}/core/connection/network_info.dart';
import 'package:{{name}}/core/errors/exceptions.dart';
import 'package:{{name}}/core/errors/failure.dart';
import 'package:{{name}}/core/params/params.dart';
import 'package:{{name}}/features/template/data/datasources/template_local_data_source.dart';
import 'package:{{name}}/features/template/data/datasources/template_remote_data_source.dart';
import 'package:{{name}}/features/template/data/models/template_model.dart';
import 'package:{{name}}/features/template/domain/repositories/template_repository.dart';
import 'package:dartz/dartz.dart';

class TemplateRepositoryImpl implements TemplateRepository {
  final TemplateRemoteDataSource remoteDataSource;
  final TemplateLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TemplateRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, TemplateModel>> getTemplate(
      {required TemplateParams templateParams}) async {
    if (await networkInfo.isConnected!) {
      try {
        TemplateModel remoteTemplate =
            await remoteDataSource.getTemplate(templateParams: templateParams);

        localDataSource.cacheTemplate(templateToCache: remoteTemplate);

        return Right(remoteTemplate);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      try {
        TemplateModel localTemplate = await localDataSource.getLastTemplate();
        return Right(localTemplate);
      } on CacheException {
        return Left(LocalStorageFailure(errorMessage: 'This is a cache exception'));
      }
    }
  }
}
