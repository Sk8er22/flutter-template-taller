import 'package:flutter_template/app/config/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("apiKey falls back to a non-empty key without NEWS_API_KEY", () {
    expect(Constants.apiKey, isNotEmpty);
  });
}
