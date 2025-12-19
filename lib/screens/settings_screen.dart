import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      backgroundColor: AppColors.getBackgroundColor(context),
      appBar: AppBar(
        backgroundColor: AppColors.getCardBackgroundColor(context),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.getTextPrimaryColor(context),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
            color: AppColors.getTextPrimaryColor(context),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Appearance Section
          Text(
            'Appearance',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.getTextSecondaryColor(context),
            ),
          ),
          const SizedBox(height: 12),
          Container(
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
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  themeProvider.isDarkMode
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
                  color: AppColors.primary,
                  size: 22,
                ),
              ),
              title: Text(
                'Dark Mode',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.getTextPrimaryColor(context),
                ),
              ),
              subtitle: Text(
                themeProvider.isDarkMode
                    ? 'Dark theme is enabled'
                    : 'Light theme is enabled',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.getTextSecondaryColor(context),
                ),
              ),
              trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
                activeColor: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 32),
          
          // Account Section
          Text(
            'Account',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.getTextSecondaryColor(context),
            ),
          ),
          const SizedBox(height: 12),
          _buildSettingsItem(
            context,
            icon: Icons.person_outline_rounded,
            title: 'Edit Profile',
            onTap: () {},
          ),
          const SizedBox(height: 8),
          _buildSettingsItem(
            context,
            icon: Icons.lock_outline_rounded,
            title: 'Change Password',
            onTap: () {},
          ),
          const SizedBox(height: 8),
          _buildSettingsItem(
            context,
            icon: Icons.notifications_outlined,
            title: 'Notification Settings',
            onTap: () {},
          ),
          const SizedBox(height: 32),
          
          // Preferences Section
          Text(
            'Preferences',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.getTextSecondaryColor(context),
            ),
          ),
          const SizedBox(height: 12),
          _buildSettingsItem(
            context,
            icon: Icons.language_outlined,
            title: 'Language',
            subtitle: 'English',
            onTap: () {},
          ),
          const SizedBox(height: 8),
          _buildSettingsItem(
            context,
            icon: Icons.location_on_outlined,
            title: 'Location',
            subtitle: 'Sri Lanka',
            onTap: () {},
          ),
          const SizedBox(height: 32),
          
          // About Section
          Text(
            'About',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.getTextSecondaryColor(context),
            ),
          ),
          const SizedBox(height: 12),
          _buildSettingsItem(
            context,
            icon: Icons.info_outline_rounded,
            title: 'App Version',
            subtitle: '1.0.0',
            onTap: () {},
          ),
          const SizedBox(height: 8),
          _buildSettingsItem(
            context,
            icon: Icons.help_outline_rounded,
            title: 'Help & Support',
            onTap: () {},
          ),
          const SizedBox(height: 8),
          _buildSettingsItem(
            context,
            icon: Icons.description_outlined,
            title: 'Terms & Conditions',
            onTap: () {},
          ),
          const SizedBox(height: 8),
          _buildSettingsItem(
            context,
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
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
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 22,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.getTextPrimaryColor(context),
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.getTextSecondaryColor(context),
                ),
              )
            : null,
        trailing: Icon(
          Icons.chevron_right_rounded,
          color: AppColors.getTextLightColor(context),
        ),
        onTap: onTap,
      ),
    );
  }
}
