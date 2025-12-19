import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? emoji;
  final VoidCallback? onViewAll;
  final bool showViewAll;

  const SectionHeader({
    super.key,
    required this.title,
    this.emoji,
    this.onViewAll,
    this.showViewAll = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.getTextPrimaryColor(context),
                ),
              ),
              if (emoji != null) ...[
                const SizedBox(width: 8),
                Text(emoji!, style: const TextStyle(fontSize: 18)),
              ],
            ],
          ),
          if (showViewAll)
            GestureDetector(
              onTap: onViewAll,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Text(
                      'View All',
                      style: GoogleFonts.poppins(
                        color: AppColors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.primary,
                      size: 12,
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

