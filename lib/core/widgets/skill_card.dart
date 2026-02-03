import 'package:flutter/material.dart';

import '../../model/skill_model.dart';

class SkillCard extends StatefulWidget {
  final Skill skill;

  const SkillCard({super.key, required this.skill});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()
          ..translate(
            0.0,
            _isHovered ? -8.0 : 0.0,
            0.0,
          ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF42A5F5).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          widget.skill.icon,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    _buildProficiencyStars(),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  widget.skill.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.skill.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF94A3B8),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProficiencyStars() {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          size: 16,
          color: index < widget.skill.proficiency
              ? const Color(0xFF42A5F5)
              : const Color(0xFF475569),
        );
      }),
    );
  }
}