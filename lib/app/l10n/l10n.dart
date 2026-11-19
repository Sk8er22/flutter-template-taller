import 'package:flutter/widget_previews.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/app/l10n/strings.dart';

export 'package:flutter_template/app/l10n/strings.dart';

extension StringsX on BuildContext {
  Strings get l10n => Strings.of(this)!;
}

// Pass to `@Preview(localizations: previewLocalizations)` so widgets that read
// `context.l10n` work inside a widget preview.
PreviewLocalizationsData previewLocalizations() =>
    const PreviewLocalizationsData(
      localizationsDelegates: Strings.localizationsDelegates,
      supportedLocales: Strings.supportedLocales,
    );
