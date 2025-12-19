import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBackgroundColor(context),
      appBar: AppBar(
        backgroundColor: AppColors.getCardBackgroundColor(context),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: AppColors.getTextPrimaryColor(context)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            color: AppColors.getTextPrimaryColor(context),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Mark all read',
              style: GoogleFonts.poppins(
                color: AppColors.primary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotificationItem(
            icon: Icons.local_offer_rounded,
            iconColor: AppColors.primary,
            title: 'Special Offer',
            message: 'Get 50% off on all electronics. Limited time only!',
            time: '2 hours ago',
            isRead: false,
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            icon: Icons.shopping_bag_rounded,
            iconColor: AppColors.success,
            title: 'Order Confirmed',
            message: 'Your order #12345 has been confirmed and will be shipped soon.',
            time: '5 hours ago',
            isRead: false,
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            icon: Icons.local_shipping_rounded,
            iconColor: AppColors.info,
            title: 'Order Shipped',
            message: 'Your order #12340 is on the way. Track your shipment now.',
            time: '1 day ago',
            isRead: true,
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            icon: Icons.favorite_rounded,
            iconColor: AppColors.error,
            title: 'Price Drop Alert',
            message: 'Premium Wireless Headphones price dropped by 20%!',
            time: '2 days ago',
            isRead: true,
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            icon: Icons.star_rounded,
            iconColor: AppColors.warning,
            title: 'Review Request',
            message: 'How was your purchase? Share your experience with us.',
            time: '3 days ago',
            isRead: true,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String message,
    required String time,
    required bool isRead,
  }) {
    return Builder(
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.getCardBackgroundColor(context),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: isRead ? FontWeight.w500 : FontWeight.w600,
                            color: AppColors.getTextPrimaryColor(context),
                          ),
                        ),
                      ),
                      if (!isRead)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.getTextSecondaryColor(context),
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    time,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: AppColors.getTextLightColor(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
