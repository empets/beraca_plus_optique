import 'package:beraca_plus_optique/core/utils/wa_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        // ── Text block ────────────────────────────────────────────
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w > 800 ? 60 : 20,
            vertical: w > 800 ? 80 : 48,
          ),
          child: Column(
            children: [
              Text(
                'Optique & Lunetterie · Abidjan',
                style: GoogleFonts.inter(
                  color: const Color(0xFF6E6E73),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: 0.3, end: 0),

              const SizedBox(height: 20),

              Text(
                'Votre vision,\nnotre priorité.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: const Color(0xFF1D1D1F),
                  fontSize: w > 800 ? 72 : 44,
                  fontWeight: FontWeight.w800,
                  height: 1.05,
                  letterSpacing: -2.5,
                ),
              )
                  .animate()
                  .fadeIn(duration: 700.ms, delay: 100.ms)
                  .slideY(begin: 0.3, end: 0),

              const SizedBox(height: 20),

              Text(
                'Des montures d\'exception sélectionnées pour chaque regard.\nQualité premium, prix accessibles, livraison en 48h.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: const Color(0xFF6E6E73),
                  fontSize: 17,
                  height: 1.6,
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 250.ms)
                  .slideY(begin: 0.2, end: 0),

              const SizedBox(height: 36),

              // Buttons
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: [
                  _PillButton(
                    label: 'Découvrir les collections',
                    onTap: () {},
                    dark: true,
                  ),
                  _PillButton(
                    label: 'Commander sur WhatsApp',
                    icon: Icons.chat_bubble_outline,
                    onTap: launchWhatsApp,
                    dark: false,
                  ),
                ],
              )
                  .animate()
                  .fadeIn(duration: 500.ms, delay: 380.ms)
                  .slideY(begin: 0.2, end: 0),
            ],
          ),
        ),

        // ── Hero image ────────────────────────────────────────────
        Container(
          width: double.infinity,
          height: w > 800 ? 520 : 240,
          color: const Color(0xFFF5F5F7),
          child: Image.network(
            'https://images.unsplash.com/photo-1760337934036-83d1dd595378?w=1600&h=700&fit=crop&auto=format',
            fit: BoxFit.cover,
            loadingBuilder: (_, child, progress) =>
                progress == null ? child : const SizedBox(),
          ),
        )
            .animate()
            .fadeIn(duration: 900.ms, delay: 500.ms)
            .slideY(begin: 0.08, end: 0),
      ],
    );
  }
}

class _PillButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool dark;
  final VoidCallback onTap;

  const _PillButton({
    required this.label,
    this.icon,
    required this.dark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        decoration: BoxDecoration(
          color: dark
              ? const Color(0xFF1D1D1F)
              : const Color(0xFFF5F5F7),
          borderRadius: BorderRadius.circular(99),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon,
                  color: dark
                      ? Colors.white
                      : const Color(0xFF1D1D1F),
                  size: 15),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: GoogleFonts.inter(
                color: dark
                    ? Colors.white
                    : const Color(0xFF1D1D1F),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}