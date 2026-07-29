import 'package:beraca_plus_optique/core/utils/wa_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhySection extends StatelessWidget {
  const WhySection({super.key});

  static const _pillars = [
    ('✦', 'Qualité Premium',   'Montures sélectionnées auprès des meilleurs fabricants.'),
    ('◎', 'Prix Accessibles',  'Tarifs justes et transparents pour toute la famille.'),
    ('◈', 'Livraison 48h',     'Livraison en 24–48h partout en Côte d\'Ivoire.'),
    ('◉', 'Support 7j/7',      'Réponse WhatsApp en moins de 30 minutes, chaque jour.'),
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w > 800 ? 4 : w > 500 ? 2 : 1;

    return Container(
      color: const Color(0xFFF5F5F7),
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Header
                Text(
                  'POURQUOI NOUS CHOISIR',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF6E6E73),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'L\'excellence à chaque détail',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF1D1D1F),
                    fontSize: w > 700 ? 40 : 28,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.2,
                  ),
                ),

                const SizedBox(height: 40),

                // Cards grid
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: _pillars.map((p) {
                    final cardW = cols == 4
                        ? (w - 40 - 48) / 4
                        : cols == 2
                            ? (w - 40 - 16) / 2
                            : w - 40;
                    return SizedBox(
                      width: cardW,
                      child: Container(
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p.$1,
                              style: GoogleFonts.inter(
                                color: const Color(0xFF1D1D1F)
                                    .withOpacity(0.25),
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              p.$2,
                              style: GoogleFonts.inter(
                                color: const Color(0xFF1D1D1F),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.3,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              p.$3,
                              style: GoogleFonts.inter(
                                color: const Color(0xFF6E6E73),
                                fontSize: 13,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 16),

                // Photo CTA band
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: w > 600 ? 260 : 180,
                        width: double.infinity,
                        child: Image.network(
                          'https://images.unsplash.com/photo-1671101075438-10de470ae13c?w=1200&h=500&fit=crop&auto=format',
                          fit: BoxFit.cover,
                          loadingBuilder: (_, child, progress) =>
                              progress == null
                                  ? child
                                  : Container(
                                      color: const Color(0xFF1D1D1F)),
                        ),
                      ),
                      Container(
                        height: w > 600 ? 260 : 180,
                        color: Colors.black.withOpacity(0.5),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Prêt à trouver vos lunettes idéales ?',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: w > 600 ? 26 : 18,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: launchWhatsApp,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28, vertical: 13),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(99),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                        Icons.chat_bubble_outline,
                                        size: 15,
                                        color: Color(0xFF1D1D1F)),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Commander sur WhatsApp',
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFF1D1D1F),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}