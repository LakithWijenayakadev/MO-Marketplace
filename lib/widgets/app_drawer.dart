import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  // Track expanded sections
  Map<String, bool> expandedSections = {
    'Policies': false,
    'Guidelines': false,
    'Delivery': false,
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.getCardBackgroundColor(context),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Stack(
        children: [
          // Background decorative elements
          _buildBackgroundDecorations(),
          
          // Main content
          SafeArea(
            child: Column(
              children: [
                // Header
                _buildHeader(context),
                
                // Menu Items
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          _buildMenuItem(
                            icon: Icons.people_outline_rounded,
                            title: 'My Community',
                            onTap: () => _navigateTo(context, 'My Community'),
                          ),
                          _buildMenuItem(
                            icon: Icons.help_outline_rounded,
                            title: 'Need Help',
                            onTap: () => _navigateTo(context, 'Need Help'),
                          ),
                          _buildMenuItem(
                            icon: Icons.settings_outlined,
                            title: 'Profile Settings',
                            onTap: () => _navigateTo(context, 'Profile Settings'),
                          ),
                          _buildExpandableMenuItem(
                            icon: Icons.policy_outlined,
                            title: 'Policies',
                            children: ['Privacy Policy', 'Terms of Service', 'Return Policy'],
                          ),
                          _buildExpandableMenuItem(
                            icon: Icons.rule_outlined,
                            title: 'Guidelines',
                            children: ['Community Guidelines', 'Seller Guidelines', 'Buyer Guidelines'],
                          ),
                          _buildExpandableMenuItem(
                            icon: Icons.local_shipping_outlined,
                            title: 'Delivery',
                            children: ['Delivery Info', 'Shipping Rates', 'Track Order'],
                          ),
                          _buildMenuItem(
                            icon: Icons.quiz_outlined,
                            title: 'FAQs',
                            onTap: () => _navigateTo(context, 'FAQs'),
                          ),
                          const SizedBox(height: 20),
                          const Divider(),
                          const SizedBox(height: 12),
                          _buildMenuItem(
                            icon: Icons.info_outline_rounded,
                            title: 'About Us',
                            onTap: () => _navigateTo(context, 'About Us'),
                          ),
                          _buildMenuItem(
                            icon: Icons.star_outline_rounded,
                            title: 'Rate Us',
                            onTap: () => _navigateTo(context, 'Rate Us'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Footer with branding
                _buildFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundDecorations() {
    return Stack(
      children: [
        // Top right curve
        Positioned(
          top: -50,
          right: -50,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withOpacity(0.05),
            ),
          ),
        ),
        // Bottom left curve
        Positioned(
          bottom: -80,
          left: -80,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withOpacity(0.05),
            ),
          ),
        ),
        // Accent line top
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 4,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primary,
                  AppColors.primary.withOpacity(0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'MENU',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.surfaceLightDark
                    : AppColors.surfaceLight,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close_rounded,
                color: AppColors.getTextPrimaryColor(context),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.getTextPrimaryColor(context),
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.getTextLightColor(context),
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableMenuItem({
    required IconData icon,
    required String title,
    required List<String> children,
  }) {
    final isExpanded = expandedSections[title] ?? false;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: isExpanded ? AppColors.surfaceLight : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  expandedSections[title] = !isExpanded;
                });
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        icon,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Builder(
                        builder: (context) => Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.getTextPrimaryColor(context),
                          ),
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Builder(
                        builder: (context) => Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: isExpanded ? AppColors.primary : AppColors.getTextLightColor(context),
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Expandable children
          AnimatedCrossFade(
            firstChild: const SizedBox(height: 0),
            secondChild: Padding(
              padding: const EdgeInsets.only(left: 56, right: 16, bottom: 12),
              child: Column(
                children: children.map((child) => _buildSubMenuItem(child)).toList(),
              ),
            ),
            crossFadeState: isExpanded 
                ? CrossFadeState.showSecond 
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }

  Widget _buildSubMenuItem(String title) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _navigateTo(context, title),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Builder(
                builder: (context) => Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.getTextSecondaryColor(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // MO Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'M',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'O',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Builder(
            builder: (context) => Text(
              "That's More like it",
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: AppColors.getTextSecondaryColor(context),
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Builder(
            builder: (context) => Text(
              'v1.3.82+240',
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: AppColors.getTextLightColor(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, String page) {
    Navigator.pop(context); // Close drawer first
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigating to $page'),
        backgroundColor: AppColors.secondary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

