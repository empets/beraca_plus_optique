import 'package:beraca_plus_optique/core/utils/wa_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  static const _info = [
    (Icons.chat_bubble_outline, 'WhatsApp',  '+225 XX XX XX XX XX', 'Réponse en 30 min'),
    (Icons.mail_outline,         'Email',     'contact@beracaplus.ci', ''),
    (Icons.location_on_outlined, 'Adresse',   'Abidjan, Côte d\'Ivoire', ''),
    (Icons.access_time_outlined, 'Horaires',  'Lun – Sam · 8h00 – 19h00', ''),
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isWide = w > 800;

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
                Text('NOUS CONTACTER',
                    style: GoogleFonts.inter(
                        color: const Color(0xFF6E6E73),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.5)),
                const SizedBox(height: 16),
                Text('Toujours là pour vous',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        color: const Color(0xFF1D1D1F),
                        fontSize: w > 700 ? 40 : 28,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1.2)),
                const SizedBox(height: 10),
                Text(
                    'Notre équipe répond en moins de 30 minutes via WhatsApp.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        color: const Color(0xFF6E6E73),
                        fontSize: 16,
                        height: 1.6)),
                const SizedBox(height: 48),

                isWide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Info list
                          Expanded(
                            child: Column(
                              children: _info
                                  .map((item) => Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 12),
                                        child: _InfoCard(item: item),
                                      ))
                                  .toList(),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // WA CTA
                          Expanded(child: _WACta()),
                        ],
                      )
                    : Column(
                        children: [
                          ..._info.map((item) => Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 12),
                                child: _InfoCard(item: item),
                              )),
                          const SizedBox(height: 4),
                          _WACta(),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final (IconData, String, String, String) item;
  const _InfoCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.$2 == 'WhatsApp' ? launchWhatsApp : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(item.$1,
                  color: const Color(0xFF1D1D1F), size: 19),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.$2,
                      style: GoogleFonts.inter(
                          color: const Color(0xFF6E6E73),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5)),
                  const SizedBox(height: 2),
                  Text(item.$3,
                      style: GoogleFonts.inter(
                          color: const Color(0xFF1D1D1F),
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            if (item.$4.isNotEmpty)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F7),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(item.$4,
                    style: GoogleFonts.inter(
                        color: const Color(0xFF6E6E73),
                        fontSize: 11,
                        fontWeight: FontWeight.w500)),
              ),
          ],
        ),
      ),
    );
  }
}

class _WACta extends StatelessWidget {
  const _WACta();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1D1F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.chat_bubble_outline,
                color: Colors.white, size: 22),
          ),
          const SizedBox(height: 24),
          Text('Commandez en un message',
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5)),
          const SizedBox(height: 10),
          Text(
              'Contactez-nous sur WhatsApp pour passer commande ou obtenir des conseils personnalisés.',
              style: GoogleFonts.inter(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 14,
                  height: 1.6)),
          const SizedBox(height: 28),
          GestureDetector(
            onTap: launchWhatsApp,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.chat_bubble_outline,
                      color: Color(0xFF1D1D1F), size: 15),
                  const SizedBox(width: 8),
                  Text('Ouvrir WhatsApp',
                      style: GoogleFonts.inter(
                          color: const Color(0xFF1D1D1F),
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text('Réponse garantie · 7 jours sur 7',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  color: Colors.white.withOpacity(0.25),
                  fontSize: 12)),
        ],
      ),
    );
  }
}