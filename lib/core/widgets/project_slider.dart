import 'package:flutter/material.dart';

class ProjectImageSlider extends StatefulWidget {
  final List<String> images;

  const ProjectImageSlider({super.key, required this.images});

  @override
  State<ProjectImageSlider> createState() => _ProjectImageSliderState();
}

class _ProjectImageSliderState extends State<ProjectImageSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.24); // ~4 images visible
  int _hoveredIndex = -1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              final isHovered = _hoveredIndex == index;

              return MouseRegion(
                onEnter: (_) => setState(() => _hoveredIndex = index),
                onExit: (_) => setState(() => _hoveredIndex = -1),
                child: GestureDetector(
                  onTapDown: (_) => setState(() => _hoveredIndex = index),
                  onTapUp: (_) => setState(() => _hoveredIndex = -1),
                  onTapCancel: () => setState(() => _hoveredIndex = -1),
                  child: AnimatedScale(
                    scale: isHovered ? 1.1 : 1.0,
                    duration: const Duration(milliseconds: 250),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: isHovered
                            ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          )
                        ]
                            : [],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          widget.images[index],
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: const Color(0xFF1E293B),
                            alignment: Alignment.center,
                            child: const Text(
                              'Image not found',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // Left/Right arrows for desktop
          if (widget.images.length > 4)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white70),
                onPressed: () {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                },
              ),
            ),
          if (widget.images.length > 4)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white70),
                onPressed: () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                },
              ),
            ),
        ],
      ),
    );
  }
}
