import 'package:dartz/dartz.dart';
import 'package:flutter_api_cleancode/core/error/failure.dart';
import 'package:flutter_api_cleancode/domain/entities/number_trivia.dart';

//No need to try and catch
abstract class NumberTriviaRepository {
  //Interface to pass a number
  //Left parameter for error handling, right for success
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);

  //Interface to return type
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
