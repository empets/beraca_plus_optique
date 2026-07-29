import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  static const _stats = [
    ('500+', 'Modèles disponibles'),
    ('4.9/5', 'Note moyenne clients'),
    ('48h', 'Délai de livraison'),
    ('7j/7', 'Service client'),
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 600;

    return Container(
      color: const Color(0xFFF5F5F7),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1024),
          child: isMobile
              ? Wrap(
                  spacing: 20,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: _stats
                      .map((s) => SizedBox(
                            width: (w - 60) / 2,
                            child: _StatItem(n: s.$1, l: s.$2),
                          ))
                      .toList(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _stats
                      .map((s) => _StatItem(n: s.$1, l: s.$2))
                      .toList(),
                ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String n;
  final String l;

  const _StatItem({required this.n, required this.l});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          n,
          style: GoogleFonts.inter(
            color: const Color(0xFF1D1D1F),
            fontSize: 32,
            fontWeight: FontWeight.w800,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          l,
          style: GoogleFonts.inter(
            color: const Color(0xFF6E6E73),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}