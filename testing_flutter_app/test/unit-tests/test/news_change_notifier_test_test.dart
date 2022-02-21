import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing_flutter_app/article.dart';
import 'package:testing_flutter_app/news_change_notifier.dart';
import 'package:testing_flutter_app/news_service.dart';

class BadMockNewsService implements NewsService {
  bool getArticalesCalleed = false;

  @override
  Future<List<Article>> getArticles() async {
    getArticalesCalleed = true;
    return [
      Article(title: 'Test 1', content: 'Test  1 content'),
      Article(title: 'Test 2', content: 'Test  1 content'),
      Article(title: 'Test 3', content: 'Test  1 content'),
      Article(title: 'Test 4', content: 'Test  1 content'),
    ];
  }
}

class MockNewsService extends Mock implements NewsService {}

void main() {
  late NewsChangeNotifier sut;
  late MockNewsService mockNewsService;

  //run set every test method
  setUp(
    () {
      mockNewsService = MockNewsService();
      sut = NewsChangeNotifier(mockNewsService);
    },
  );
  test(
    'Initial values are correct',
        () async {
      expect(sut.articles, []);
      expect(sut.isLoading, false);
    },
  );
  //1
  //2
  //   //3
  group(
    'getArticales',
    () {


      test(
        'Get articales using the newswService',
        () async {
          when(() => mockNewsService.getArticles()).thenAnswer((_) async => []);
          await sut.getArticles();
          verify(() => mockNewsService.getArticles()).called(1);
        },
      );

      final articalesFromService = [
        Article(title: 'Test 1', content: 'Test 1 Content'),
        Article(title: 'Test 2', content: 'Test 2 Content'),
        Article(title: 'Test 3', content: 'Test 3 Content'),
      ];
      void arrangeNewsServiceReturns3Articles() {
        when(() => mockNewsService.getArticles()).thenAnswer((_) async => articalesFromService,);
      }

      test(
        """Indicates loading of data, 
      sets articales to the ones from the service, 
      indicates that data is not being loaded anymore """,
        () async {
          arrangeNewsServiceReturns3Articles();
          final future = sut.getArticles();

          expect(sut.isLoading, true);
          await future;
          expect(sut.articles,
          articalesFromService,
          );
          expect(sut.isLoading, false);
          // when(() => mockNewsService.getArticles()).thenAnswer((_) async => [
          //
          //   Article(title: 'Articales', content: 'Content')
          // ]);
        },
      );
    },
  );


}
