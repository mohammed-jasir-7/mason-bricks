

import 'package:couple_squad/core/constants/constants.dart';

import '../../domain/entities/{{name.lowerCase()}}_entity.dart';

class {{name.pascalCase()}}Model extends {{name.pascalCase()}}Entity {
  const {{name.pascalCase()}}Model({
    required String {{name.lowerCase()}},
  }) : super(
          {{name.lowerCase()}}: {{name.lowerCase()}},
        );

  factory {{name.pascalCase()}}Model.fromJson({required Map<String, dynamic> json}) {
    return {{name.pascalCase()}}Model(
      {{name.lowerCase()}}: json[k{{name.pascalCase()}}],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      k{{name.pascalCase()}}: {{name.lowerCase()}},
    };
  }
}
