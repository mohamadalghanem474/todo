import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class ResetPassword extends UseCase<bool, Map> {
  final AuthRepository repository;

  ResetPassword(this.repository);

  @override
  Future<Either<Failure, bool>> call(Map authData) async {
    return await repository.resetPassword(authData: authData);
  }
}