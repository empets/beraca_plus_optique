import 'package:beraca_plus_optique/feature/home/presentatioln/page/collections_section.dart';
import 'package:beraca_plus_optique/feature/home/presentatioln/page/contact_section.dart';
import 'package:beraca_plus_optique/feature/home/presentatioln/page/footer_section.dart';
import 'package:beraca_plus_optique/feature/home/presentatioln/page/hero_section.dart';
import 'package:beraca_plus_optique/feature/home/presentatioln/page/stats_section.dart';
import 'package:beraca_plus_optique/feature/home/presentatioln/page/testimonials_section.dart';
import 'package:beraca_plus_optique/feature/home/presentatioln/page/why_section.dart';
import 'package:beraca_plus_optique/feature/home/presentatioln/page/widget/announcement_bar.dart';
import 'package:beraca_plus_optique/feature/home/presentatioln/page/widget/nav_bar.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scroll = ScrollController();
  bool _scrolled  = false;
  bool _menuOpen  = false;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      final s = _scroll.offset > 48;
      if (s != _scrolled) setState(() => _scrolled = s);
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ── Scrollable content ─────────────────────────────
          SingleChildScrollView(
            controller: _scroll,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Offset for announcement bar (40) + nav (52)
                const SizedBox(height: 92),
                const HeroSection(),
                const StatsSection(),
                const CollectionsSection(),
                const WhySection(),
                const TestimonialsSection(),
                const ContactSection(),
                const FooterSection(),
              ],
            ),
          ),

          // ── Fixed top header ───────────────────────────────
          Positioned(
            top: 0, left: 0, right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AnnouncementBar(),
                NavBar(
                  scrolled:  _scrolled,
                  menuOpen:  _menuOpen,
                  onMenuTap: () => setState(() => _menuOpen = !_menuOpen),
                ),
              ],
            ),
          ),

          // ── Mobile menu overlay ────────────────────────────
          if (_menuOpen)
            Positioned(
              top: 92, left: 0, right: 0,
              child: Material(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(height: 1, color: Color(0x14000000)),
                    ...[
                      'Collections',
                      'Pourquoi nous',
                      'Avis',
                      'Contact',
                    ].map(
                      (l) => ListTile(
                        title: Text(l,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1D1D1F),
                            )),
                        trailing: const Icon(Icons.chevron_right,
                            color: Color(0x44000000), size: 18),
                        onTap: () => setState(() => _menuOpen = false),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: GestureDetector(
                        onTap: () {
                          setState(() => _menuOpen = false);
                        },
                        child: Container(
                          width: double.infinity,
                          padding:
                              const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1D1D1F),
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: const Text(
                            'Commander sur WhatsApp',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}