abstract class Constants {
  const Constants._();

  // TODO: Replace with your values
  // Appstores
  static const appstoreAppId = "123124123";
  static const playstoreAppId = "com.levinriegner.fluttertemplate";

  // Keys
  // Students pass their own key via --dart-define=NEWS_API_KEY=<key>; this
  // shared demo key is only a fallback (its small daily quota runs out).
  static const apiKey = String.fromEnvironment(
    "NEWS_API_KEY",
    defaultValue: "f32ad1e0dc6e4a4b838218e8f3dac87f",
  );
}
