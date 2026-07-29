
import 'package:beraca_plus_optique/core/utils/wa_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final year = DateTime.now().year;

    return Container(
      color: const Color(0xFF1D1D1F),
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              // Top row
              w > 700
                  ? Row(
                      children: [
                        Text('Beraca Plus',
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.4)),
                        const Spacer(),
                        ...[
                          'Collections',
                          'Pourquoi nous',
                          'Avis clients',
                          'Contact',
                        ].map((l) => Padding(
                              padding: const EdgeInsets.only(left: 28),
                              child: Text(l,
                                  style: GoogleFonts.inter(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                            )),
                        const SizedBox(width: 28),
                        ...[
                          ('Facebook',  'https://facebook.com'),
                          ('Instagram', 'https://instagram.com'),
                          ('WhatsApp',  ''),
                        ].map((s) => Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: GestureDetector(
                                onTap: s.$1 == 'WhatsApp'
                                    ? launchWhatsApp
                                    : null,
                                child: Text(s.$1,
                                    style: GoogleFonts.inter(
                                        color:
                                            Colors.white.withOpacity(0.35),
                                        fontSize: 13)),
                              ),
                            )),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Beraca Plus',
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 20,
                          runSpacing: 12,
                          children:
                              ['Collections', 'Pourquoi nous', 'Avis', 'Contact']
                                  .map((l) => Text(l,
                                      style: GoogleFonts.inter(
                                          color:
                                              Colors.white.withOpacity(0.4),
                                          fontSize: 13)))
                                  .toList(),
                        ),
                      ],
                    ),

              const SizedBox(height: 40),
              Divider(color: Colors.white.withOpacity(0.08)),
              const SizedBox(height: 20),

              // Bottom row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('© $year Beraca Plus',
                      style: GoogleFonts.inter(
                          color: Colors.white.withOpacity(0.25),
                          fontSize: 12)),
                  Text('Abidjan, Côte d\'Ivoire',
                      style: GoogleFonts.inter(
                          color: Colors.white.withOpacity(0.15),
                          fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}