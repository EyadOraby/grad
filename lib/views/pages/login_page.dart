import 'package:grad/l10n/sanad_strings.dart';
import 'package:flutter/material.dart';
import 'package:grad/state/sanad_store.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:grad/views/pages/accessibility_page.dart';
import 'package:grad/views/pages/home_page.dart';
import 'package:grad/views/pages/sign_up_page.dart';
import 'package:grad/views/pages/staff/staff_portal.dart';
import 'package:grad/views/widgets/sanad_ui.dart';

/// Egyptian national IDs are 14 digits.
String? validateNationalId(String? v) {
  final digits = (v ?? '').trim();
  if (digits.isEmpty) return 'Please enter your national ID';
  if (!RegExp(r'^\d{14}$').hasMatch(digits))
    return 'A national ID is 14 digits';
  return null;
}

/// Sign in with a national ID, continue as a guest, or open a demo account.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  final _id = TextEditingController();
  final _password = TextEditingController();
  bool _hidden = true;

  @override
  void dispose() {
    _id.dispose();
    _password.dispose();
    super.dispose();
  }

  void _go(Widget page) => Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (_) => page), (route) => false);

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 900;
    final form = ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 440), child: _formColumn());
    return Scaffold(
      backgroundColor: SanadColors.surface,
      body: SafeArea(
        child: Column(children: [
          const _GovBar(),
          Expanded(
            child: wide
                ? Row(children: [
                    const Expanded(flex: 5, child: _Hero()),
                    Expanded(
                      flex: 4,
                      child: Center(
                          child: SingleChildScrollView(
                              padding: const EdgeInsets.all(40), child: form)),
                    ),
                  ])
                : SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(22, 20, 22, 28),
                    child: Center(
                      child: Column(children: [
                        Image.asset('assets/new_logo_hq-removebg-preview.png',
                            height: 130, semanticLabel: context.t('SANAD')),
                        const SizedBox(height: 6),
                        form,
                      ]),
                    ),
                  ),
          ),
        ]),
      ),
    );
  }

  Widget _formColumn() {
    InputDecoration field(String label, IconData icon, {Widget? suffix}) =>
        InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          suffixIcon: suffix,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: SanadColors.line),
          ),
        );
    return Form(
      key: _form,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Semantics(
          header: true,
          child: Text(context.t('Sign in to SANAD'),
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: SanadColors.ink)),
        ),
        const SizedBox(height: 6),
        Text(context.t('Government, medical and job services in one place.'),
            style: TextStyle(color: SanadColors.inkMuted)),
        const SizedBox(height: 22),
        TextFormField(
          controller: _id,
          keyboardType: TextInputType.number,
          maxLength: 14,
          decoration:
              field(context.t('National ID (14 digits)'), Icons.badge_outlined)
                  .copyWith(counterText: ''),
          validator: (v) {
            final error = validateNationalId(v);
            return error == null ? null : context.t(error);
          },
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _password,
          obscureText: _hidden,
          decoration: field(
            context.t('Password'),
            Icons.lock_outline_rounded,
            suffix: IconButton(
              tooltip: _hidden
                  ? context.t('Show password')
                  : context.t('Hide password'),
              onPressed: () => setState(() => _hidden = !_hidden),
              icon: Icon(_hidden
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined),
            ),
          ),
          validator: (v) => (v == null || v.length < 6)
              ? context.t('Use at least 6 characters')
              : null,
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: TextButton(
              onPressed: () {}, child: Text(context.t('Forgot password?'))),
        ),
        SizedBox(
          height: 54,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: SanadColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
            ),
            onPressed: () {
              if (_form.currentState!.validate()) _go(const HomePage());
            },
            child: Text(context.t('Sign in'),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          ),
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            foregroundColor: SanadColors.primary,
            side: const BorderSide(color: SanadColors.primary),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          onPressed: () => _go(const HomePage()),
          icon: const Icon(Icons.person_outline_rounded),
          label: Text(context.t('Continue as guest'),
              style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 22),
        Row(children: [
          Expanded(child: Divider()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(context.t('Try a demo account'),
                style: TextStyle(
                    color: SanadColors.inkMuted, fontWeight: FontWeight.w600)),
          ),
          Expanded(child: Divider()),
        ]),
        const SizedBox(height: 12),
        _DemoTile(
          icon: Icons.accessible_forward_rounded,
          title: 'Citizen',
          note: context
              .t('A booked doctor, tracked requests and a job application'),
          onTap: () {
            sanadStore.seedDemoCitizen();
            _go(const HomePage());
          },
        ),
        const SizedBox(height: 8),
        _DemoTile(
          icon: Icons.account_balance_outlined,
          title: 'Staff',
          note: context.t('Review requests, appointments and applications'),
          onTap: () => _go(const StaffPortal()),
        ),
        const SizedBox(height: 12),
        Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(context.t("Don't have an account?"),
                  style: TextStyle(color: SanadColors.inkMuted)),
              TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SignUpPage())),
                child: Text(context.t('Create one')),
              ),
            ]),
      ]),
    );
  }
}

/// A thin official strip with the accessibility shortcut.
class _GovBar extends StatelessWidget {
  const _GovBar();

  @override
  Widget build(BuildContext context) => Column(children: [
        Container(
          color: SanadColors.primary,
          padding: const EdgeInsets.fromLTRB(16, 6, 6, 6),
          child: Row(children: [
            const Icon(Icons.account_balance_outlined,
                color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Text(context.t('SANAD · Citizen services portal'),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13)),
            ),
            TextButton(
              onPressed: sanadStore.toggleLanguage,
              child: Text(context.isArabic ? 'English' : 'العربية',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700)),
            ),
            IconButton(
              tooltip: context.t('Accessibility settings'),
              color: Colors.white,
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AccessibilityPage())),
              icon: const Icon(Icons.accessibility_new_rounded),
            ),
          ]),
        ),
        Container(height: 3, color: SanadColors.gold),
      ]);
}

class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(44),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [SanadColors.primary, SanadColors.primaryDark],
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Image.asset('assets/new_logo_hq-removebg-preview.png',
                height: 70, semanticLabel: context.t('SANAD')),
          ),
          Spacer(),
          Text(context.t('More than a\nhelping hand.'),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  height: 1.1,
                  fontWeight: FontWeight.w800)),
          SizedBox(height: 22),
          for (final (icon, text) in [
            (
              Icons.badge_outlined,
              context.t('Renew your ID and track every request')
            ),
            (
              Icons.medical_services_outlined,
              context.t('Book doctors and hospitals near you')
            ),
            (Icons.work_outline_rounded, context.t('Find jobs suited to you')),
            (
              Icons.accessibility_new_rounded,
              context.t('Large text, high contrast and screen readers')
            ),
          ])
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(children: [
                Icon(icon, color: SanadColors.gold),
                const SizedBox(width: 12),
                Expanded(
                    child: Text(context.t(text),
                        style: TextStyle(color: Colors.white, fontSize: 16))),
              ]),
            ),
          const Spacer(),
        ]),
      );
}

class _DemoTile extends StatelessWidget {
  const _DemoTile(
      {required this.icon,
      required this.title,
      required this.note,
      required this.onTap});
  final IconData icon;
  final String title;
  final String note;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => SanadCard(
        onTap: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                color: SanadColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: SanadColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(context.t('$title demo'),
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: SanadColors.ink)),
              Text(context.t(note),
                  style:
                      TextStyle(color: SanadColors.inkMuted, fontSize: 12.5)),
            ]),
          ),
          const Icon(Icons.arrow_forward_ios_rounded,
              size: 16, color: SanadColors.inkMuted),
        ]),
      );
}
