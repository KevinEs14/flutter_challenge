import 'package:flutter_challenge/repositories/item_repository_http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';


void main() async{
  await dotenv.load(fileName: "assets/.env");
  test('Fetch posts from API', () async {
    final apiService = ItemRepositoryHttp();
    final posts = await apiService.getItemsList(1);
    expect(posts.length, greaterThan(0));
  });

  test('Fetch posts from API', () async {
    final apiService = ItemRepositoryHttp();
    final item = await apiService.getItemDetails(1);
    expect(item.title, equals("sunt aut facere repellat provident occaecati excepturi optio reprehenderit"));
  });
  
}
