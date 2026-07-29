import 'package:beraca_plus_optique/core/utils/wa_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:beraca_plus_optique/feature/home/data/products.dart';

class CollectionsSection extends StatefulWidget {
  const CollectionsSection({super.key});

  @override
  State<CollectionsSection> createState() => _CollectionsSectionState();
}

class _CollectionsSectionState extends State<CollectionsSection> {
  String _active = 'Tous';

  List<Product> get _filtered => _active == 'Tous'
      ? kProducts
      : kProducts.where((p) => p.category == _active).toList();

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
                // Header
                Text(
                  'NOS COLLECTIONS',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF6E6E73),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Des montures pour chaque style',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF1D1D1F),
                    fontSize: w > 700 ? 40 : 28,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Chaque modèle est sélectionné pour sa qualité, son confort et son élégance.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF6E6E73),
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 36),

                // Filter chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: kCategories.map((cat) {
                      final isActive = _active == cat;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: () => setState(() => _active = cat),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 9),
                            decoration: BoxDecoration(
                              color: isActive
                                  ? const Color(0xFF1D1D1F)
                                  : const Color(0xFFF5F5F7),
                              borderRadius: BorderRadius.circular(99),
                            ),
                            child: Text(
                              cat,
                              style: GoogleFonts.inter(
                                color: isActive
                                    ? Colors.white
                                    : const Color(0xFF6E6E73),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 36),

                // Grid
                LayoutBuilder(
                  builder: (ctx, box) {
                    final cols = box.maxWidth > 900
                        ? 4
                        : box.maxWidth > 600
                            ? 3
                            : 2;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: cols,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.72,
                      ),
                      itemCount: _filtered.length,
                      itemBuilder: (_, i) =>
                          _ProductCard(product: _filtered[i]),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductCard extends StatefulWidget {
  final Product product;
  const _ProductCard({required this.product});

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Background
                  Container(color: const Color(0xFFF5F5F7)),

                  // Photo
                  AnimatedScale(
                    scale: _hovered ? 1.05 : 1.0,
                    duration: const Duration(milliseconds: 400),
                    child: Image.network(
                      widget.product.imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (_, child, progress) =>
                          progress == null ? child : const SizedBox(),
                    ),
                  ),

                  // Tag
                  if (widget.product.tag != null)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Text(
                          widget.product.tag!,
                          style: GoogleFonts.inter(
                            color: const Color(0xFF1D1D1F),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),

                  // Hover overlay with Commander button
                  AnimatedOpacity(
                    opacity: _hovered ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 250),
                    child: Container(
                      color: Colors.black.withOpacity(0.08),
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: launchWhatsApp,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 9),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(99),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 16,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.chat_bubble_outline,
                                  size: 13,
                                  color: Color(0xFF1D1D1F)),
                              const SizedBox(width: 6),
                              Text(
                                'Commander',
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF1D1D1F),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Info
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF1D1D1F),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.product.category,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF6E6E73),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.product.price,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF1D1D1F),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ' F',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF6E6E73),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}