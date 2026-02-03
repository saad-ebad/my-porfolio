import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.accent.withOpacity(0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.accentLight,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Available for Freelance',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.accentLight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Senior Flutter Developer &\nMobile App Specialist',
          style: AppTextStyles.heading1,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 600,
          child: Text(
            'I build high-performance, scalable mobile applications with clean architecture and modern Flutter practices. Specializing in Riverpod, MVVM, and responsive UI design.',
            style: AppTextStyles.bodyLarge,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('View Projects'),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_right_alt, size: 20),
                ],
              ),
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                side: const BorderSide(color: AppColors.accentLight),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Download CV'),
                  SizedBox(width: 8),
                  Icon(Icons.download, size: 20),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 48),
        Row(
          children: [
            _buildTechChip('Flutter'),
            const SizedBox(width: 12),
            _buildTechChip('Riverpod'),
            const SizedBox(width: 12),
            _buildTechChip('Firebase'),
            const SizedBox(width: 12),
            _buildTechChip('MVVM'),
          ],
        ),
      ],
    );
  }

  Widget _buildTechChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: AppTextStyles.caption.copyWith(
          color: AppColors.accentLight,
        ),
      ),
    );
  }
}