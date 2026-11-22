import 'package:grad/l10n/sanad_strings.dart';
import 'package:material_ui/material_ui.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:grad/views/pages/accessibility_page.dart';

/// Page frame used by every citizen screen.
///
/// - Phones: app bar, drawer and bottom navigation.
/// - Tablets: the same, with content held to a readable width.
/// - Desktops (900px and wider): a side menu, an official header and
///   centered content, like a government web portal.
class TemplatePage extends StatelessWidget {
  final Widget body;
  final String appBarTitle;
  final Widget? drawerMobile;
  final Widget? bottomNavBar;
  final int index;

  const TemplatePage({
    super.key,
    required this.body,
    required this.appBarTitle,
    required this.index,
    this.drawerMobile,
    required this.bottomNavBar,
  });

  static const desktopFrom = 900.0;

  Widget _accessibilityButton(BuildContext context, Color color) => IconButton(
        tooltip: context.t('Accessibility settings'),
        color: color,
        icon: const Icon(Icons.accessibility_new_rounded),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const AccessibilityPage())),
      );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= desktopFrom) return _desktop(context);

    return Scaffold(
      drawer: drawerMobile == null ? null : Drawer(child: drawerMobile),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: SanadColors.ink),
        backgroundColor: SanadColors.surface,
        actions: [_accessibilityButton(context, SanadColors.ink)],
        title: Semantics(
          label: context.t('SANAD'),
          excludeSemantics: true,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: SanadColors.primary, borderRadius: BorderRadius.circular(8)),
                child: const Text('س', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700, height: 1.1)),
              ),
              const SizedBox(width: 8),
              Text(context.t('SANAD'),
                  style: const TextStyle(color: SanadColors.primary, fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: 2)),
            ],
          ),
        ),
        // A thin gold rule under the header, a nod to official documents.
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: Container(
            height: 3,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                SanadColors.gold.withValues(alpha: 0),
                SanadColors.gold,
                SanadColors.gold.withValues(alpha: 0),
              ]),
            ),
          ),
        ),
      ),
      body: width > 700
          ? Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: body))
          : body,
      bottomNavigationBar: bottomNavBar,
    );
  }

  Widget _desktop(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        SizedBox(
          width: 270,
          child: Material(
            color: Colors.white,
            child: SafeArea(child: drawerMobile ?? const SizedBox()),
          ),
        ),
        const VerticalDivider(width: 1),
        Expanded(
          child: Column(children: [
            Container(
              color: SanadColors.primary,
              padding: const EdgeInsets.fromLTRB(28, 14, 16, 14),
              child: SafeArea(
                bottom: false,
                child: Row(children: [
                  Semantics(
                    header: true,
                    child: Text(appBarTitle,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                  ),
                  const Spacer(),
                  _accessibilityButton(context, Colors.white),
                ]),
              ),
            ),
            Container(height: 3, color: SanadColors.gold),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 980),
                    child: body),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
