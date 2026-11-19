import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class PlatformAwareWidget<I extends Widget, A extends Widget>
    extends StatelessWidget {
  const PlatformAwareWidget({
    super.key,
  });

  // Platform from dart:io throws on web, which uses the Android widget
  @override
  Widget build(BuildContext context) => !kIsWeb && Platform.isIOS
      ? buildIosWidget(context)
      : buildAndroidWidget(context);

  I buildIosWidget(BuildContext context);

  A buildAndroidWidget(BuildContext context);
}
