import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  static const _data = [
    ('KA', 'Koné Aminata',  'Cliente fidèle',    '"Des lunettes de qualité exceptionnelle, livrées en 2 jours. Je suis absolument ravie."'),
    ('TI', 'Touré Ibrahim', 'Client depuis 2022', '"Excellent service et prix très raisonnables. Je recommande vivement Beraca Plus."'),
    ('DM', 'Diallo Mariam', 'Mère de famille',    '"Mes enfants adorent leurs nouvelles lunettes. Le rapport qualité-prix est imbattable."'),
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'AVIS CLIENTS',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF6E6E73),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Ils nous font confiance',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF1D1D1F),
                    fontSize: w > 700 ? 40 : 28,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.2,
                  ),
                ),
                const SizedBox(height: 40),

                // Cards
                w > 700
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _data
                            .map((t) => Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: _TestiCard(t: t),
                                  ),
                                ))
                            .toList(),
                      )
                    : Column(
                        children: _data
                            .map((t) => Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 16),
                                  child: _TestiCard(t: t),
                                ))
                            .toList(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TestiCard extends StatelessWidget {
  final (String, String, String, String) t;
  const _TestiCard({required this.t});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stars
          Row(
            children: List.generate(
              5,
              (_) => const Padding(
                padding: EdgeInsets.only(right: 2),
                child: Icon(Icons.star_rounded,
                    size: 14, color: Color(0xFF1D1D1F)),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            t.$4,
            style: GoogleFonts.inter(
              color: const Color(0xFF1D1D1F).withOpacity(0.75),
              fontSize: 15,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFF1D1D1F),
                  borderRadius: BorderRadius.circular(99),
                ),
                alignment: Alignment.center,
                child: Text(
                  t.$1,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.$2,
                    style: GoogleFonts.inter(
                      color: const Color(0xFF1D1D1F),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    t.$3,
                    style: GoogleFonts.inter(
                      color: const Color(0xFF6E6E73),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}