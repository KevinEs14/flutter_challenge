import 'package:flutter_challenge/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test('Fetch posts from API', () async {
    final apiService = ApiService();
    final posts = await apiService.obtainItems(1);
    expect(posts.length, greaterThan(0));
  });
}
