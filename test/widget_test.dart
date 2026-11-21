import 'package:flutter_test/flutter_test.dart';
import 'package:grad/deep_links.dart';
import 'package:grad/views/pages/home_page.dart';
import 'package:grad/views/pages/jobs_services/jobs_page.dart';

void main() {
  test('opens a demo screen named in the URL', () {
    expect(deepLinkedScreen(Uri.parse('https://x.test/?screen=home')), isA<HomePage>());
    expect(deepLinkedScreen(Uri.parse('https://x.test/?screen=jobs')), isA<JobsPage>());
  });

  test('ignores unknown or missing screens', () {
    expect(deepLinkedScreen(Uri.parse('https://x.test/?screen=nope')), isNull);
    expect(deepLinkedScreen(Uri.parse('https://x.test/')), isNull);
  });

  test('every demo screen builds a widget', () {
    for (final build in demoScreens.values) {
      expect(build(), isNotNull);
    }
  });
}
