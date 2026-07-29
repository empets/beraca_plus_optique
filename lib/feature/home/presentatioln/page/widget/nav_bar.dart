import 'package:beraca_plus_optique/core/utils/wa_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {
  final bool scrolled;
  final VoidCallback onMenuTap;
  final bool menuOpen;

  const NavBar({
    super.key,
    required this.scrolled,
    required this.onMenuTap,
    required this.menuOpen,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 52,
      decoration: BoxDecoration(
        color: scrolled
            ? Colors.white.withOpacity(0.92)
            : Colors.white.withOpacity(0.8),
        border: Border(
          bottom: BorderSide(
            color: scrolled
                ? Colors.black.withOpacity(0.08)
                : Colors.transparent,
            width: 1,
          ),
        ),
        boxShadow: scrolled
            ? [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]
            : [],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            // Logo
            Text(
              'Beraca Plus',
              style: GoogleFonts.inter(
                color: const Color(0xFF1D1D1F),
                fontSize: 17,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.4,
              ),
            ),

            const Spacer(),

            if (!isMobile) ...[
              // Desktop nav links
              ...[
                'Collections',
                'Pourquoi nous',
                'Avis',
                'Contact',
              ].map(
                (l) => Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(
                    l,
                    style: GoogleFonts.inter(
                      color: const Color(0xFF6E6E73),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 28),
              // CTA pill
              GestureDetector(
                onTap: launchWhatsApp,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D1D1F),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.chat_bubble_outline,
                          color: Colors.white, size: 13),
                      const SizedBox(width: 6),
                      Text(
                        'Commander',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ] else ...[
              // Mobile hamburger
              IconButton(
                onPressed: onMenuTap,
                icon: Icon(
                  menuOpen ? Icons.close : Icons.menu,
                  color: const Color(0xFF1D1D1F),
                  size: 22,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

