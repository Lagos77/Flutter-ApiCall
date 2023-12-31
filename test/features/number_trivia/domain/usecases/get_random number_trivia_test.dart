import 'package:dartz/dartz.dart';
import 'package:flutter_api_cleancode/core/usecases/usecase.dart';
import 'package:flutter_api_cleancode/domain/entities/number_trivia.dart';
import 'package:flutter_api_cleancode/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_api_cleancode/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_api_cleancode/domain/usecases/get_random_number_trivia.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetRandomNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    '',
    () async {
      //when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
      when(() => mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => Right(tNumberTrivia));

      final result = await usecase(NoParams());

      expect(result, Right(tNumberTrivia));
      verify(() => mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
