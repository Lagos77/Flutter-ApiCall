import 'package:dartz/dartz.dart';
import 'package:flutter_api_cleancode/core/error/failure.dart';
import 'package:flutter_api_cleancode/domain/entities/number_trivia.dart';
import 'package:flutter_api_cleancode/domain/repositories/number_trivia_repository.dart';
import 'package:meta/meta.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> execute({
    required int number,
  }) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
