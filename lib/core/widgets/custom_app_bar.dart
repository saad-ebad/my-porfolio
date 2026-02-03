import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 80,
      floating: true,
      pinned: true,
      backgroundColor: AppColors.background.withOpacity(0.95),
      surfaceTintColor: Colors.transparent,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final isExpanded = constraints.maxHeight > 70;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Portfolio',
                  style: isExpanded
                      ? AppTextStyles.heading3.copyWith(
                    color: AppColors.accentLight,
                  )
                      : AppTextStyles.titleLarge.copyWith(
                    color: AppColors.accentLight,
                  ),
                ),
                Row(
                  children: [
                    _buildNavItem('Home', 0),
                    _buildNavItem('Projects', 1),
                    _buildNavItem('About', 2),
                    _buildNavItem('Contact', 3),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Get In Touch'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavItem(String text, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
        ),
        child: Text(
          text,
          style: AppTextStyles.bodyMedium,
        ),
      ),
    );
  }
}