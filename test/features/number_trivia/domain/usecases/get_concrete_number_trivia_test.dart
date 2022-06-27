import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;
  late int tNumber;
  late NumberTrivia tNumberTrivia;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository!);
    tNumber = 1;
    tNumberTrivia = const NumberTrivia('test', 1);
  });

  test(
    'should get trivia for the number from the repository',
    () async {
      //arrange
      when(mockNumberTriviaRepository?.getConcreteNumberTrivia(tNumber))
          .thenAnswer((_) async => right(tNumberTrivia));
      //act
      final result = await usecase?.execute(number: tNumber);
      //assert
      expect(result, right(tNumberTrivia));
      verify(mockNumberTriviaRepository?.getConcreteNumberTrivia(1));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
