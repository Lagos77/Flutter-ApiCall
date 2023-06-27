import 'package:dartz/dartz.dart';
import 'package:flutter_api_cleancode/domain/entities/number_trivia.dart';
import 'package:flutter_api_cleancode/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_api_cleancode/domain/usecases/get_concrete_number_trivia.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    '',
    () async {
      //when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
      when(() => mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
          .thenAnswer((_) async => Right(tNumberTrivia));

      final result = await usecase.execute(number: tNumber);

      expect(result, Right(tNumberTrivia));
      verify(() => mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
