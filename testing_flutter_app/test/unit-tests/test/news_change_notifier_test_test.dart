import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing_flutter_app/article.dart';
import 'package:testing_flutter_app/news_change_notifier.dart';
import 'package:testing_flutter_app/news_service.dart';

class BadMockNewsService implements NewsService {
  bool getArticalesCalleed = false;

  @override
  Future<List<Article>> getArticles() async{
    getArticalesCalleed = true;
return[
  Article(title: 'Test 1', content: 'Test  1 content'),
  Article(title: 'Test 2', content: 'Test  1 content'),
  Article(title: 'Test 3', content: 'Test  1 content'),
  Article(title: 'Test 4', content: 'Test  1 content'),
];
  }

}

class MockNewsService extends Mock implements NewsService{

}

void main() {
  late NewsChangeNotifier sut;
  late MockNewsService mockNewsService;


  //run set every test method
  setUp(() {
    mockNewsService = MockNewsService();
    sut = NewsChangeNotifier(mockNewsService);
  },);
    //1
  //2
  //3

  test(
    'Initial values are correct',
    () {
      expect(sut.articles, []);
      expect(sut.isLoading, false);

    },
  );
}
