import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/project_model.dart';

class EnhancedProjectCard extends StatefulWidget {
  final Project project;

  const EnhancedProjectCard({super.key, required this.project});

  @override
  State<EnhancedProjectCard> createState() => _EnhancedProjectCardState();
}

class _EnhancedProjectCardState extends State<EnhancedProjectCard> {
  final PageController _pageController = PageController(viewportFraction: 0.25);
  int _currentPage = 0;
  int _hoveredIndex = -1;
  bool _isHovered = false;
  OverlayEntry? _overlayEntry;
  final ScrollController _descriptionScrollController = ScrollController(); // Add this

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_updatePage);
  }

  void _updatePage() {
    final newPage = (_pageController.page ?? 0).round();
    if (newPage != _currentPage) {
      setState(() => _currentPage = newPage);
    }
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }


  void _showGithubInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Private Client Project'),
        content: const Text(
          'This project was developed for a client, so the source code is not '
              'publicly available.\n\n'
              'If you are interested in reviewing the code structure, architecture, '
              'or implementation details, I’d be happy to walk you through it or '
              'share relevant samples.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showImageOverlay(BuildContext context, int index) {
    // Remove any existing overlay
    _removeOverlay();

    // Create new overlay
    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _removeOverlay,
        onPanUpdate: (details) {
          if (details.delta.dy > 10) {
            _removeOverlay();
          }
        },
        child: Material(
          color: Colors.black.withOpacity(0.85),
          child: SafeArea(
            child: Column(
              children: [
                // Close button
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IconButton(
                      onPressed: _removeOverlay,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),

                // Image counter
                Text(
                  '${index + 1} / ${widget.project.screenshots.length}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),

                // Full screen image - CHANGED TO FILL AVAILABLE SPACE
                Expanded(
                  child: InteractiveViewer(
                    panEnabled: true,
                    minScale: 0.1, // Reduced min scale for better zoom out
                    maxScale: 10, // Increased max scale for better zoom in
                    child: Center(
                      child: Hero(
                        tag: 'project_image_${widget.project.title}_$index',
                        child: Image.asset(
                          widget.project.screenshots[index],
                          fit: BoxFit.scaleDown, // Changed from contain to scaleDown
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              color: Colors.grey[800],
                              child: const Center(
                                child: Icon(
                                  Icons.broken_image,
                                  color: Colors.white70,
                                  size: 50,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                // Navigation arrows (if multiple images)
                if (widget.project.screenshots.length > 1)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Previous button
                        if (index > 0)
                          ElevatedButton.icon(
                            onPressed: () {
                              _removeOverlay();
                              _showImageOverlay(context, index - 1);
                            },
                            icon: const Icon(Icons.arrow_back),
                            label: const Text('Previous'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.1),
                              foregroundColor: Colors.white,
                            ),
                          )
                        else
                          const SizedBox(width: 100),

                        // Next button
                        if (index < widget.project.screenshots.length - 1)
                          ElevatedButton.icon(
                            onPressed: () {
                              _removeOverlay();
                              _showImageOverlay(context, index + 1);
                            },
                            icon: const Icon(Icons.arrow_forward),
                            label: const Text('Next'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.1),
                              foregroundColor: Colors.white,
                            ),
                          )
                        else
                          const SizedBox(width: 100),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );

    // Insert overlay
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_updatePage);
    _pageController.dispose();
    _descriptionScrollController.dispose(); // Don't forget to dispose
    _removeOverlay(); // Clean up overlay
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenshots = widget.project.screenshots;
    final hasMultiplePages = screenshots.length > 4;
    final pageCount = (screenshots.length / 4).ceil();

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Card(
          elevation: _isHovered ? 8 : 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 400, // Minimum height for the card
              maxHeight: MediaQuery.of(context).size.height * 0.8, // Maximum 80% of screen height
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with title and category
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.project.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.project.category,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Screenshots Section - Increased height for larger preview
                  _buildScreenshotsSection(screenshots, hasMultiplePages, pageCount),
                  const SizedBox(height: 12),

                  // Description - Made scrollable
                  _buildDescriptionSection(), // Changed this
                  const SizedBox(height: 12),

                  // Technologies
                  _buildTechnologiesSection(),
                  const SizedBox(height: 12),

                  // Buttons
                  _buildActionButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScreenshotsSection(
      List<String> screenshots, bool hasMultiplePages, int pageCount) {
    return Column(
      children: [
        SizedBox(
          height: 180, // Increased height for larger preview
          child: PageView.builder(
            controller: _pageController,
            itemCount: screenshots.length,
            padEnds: false,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: MouseRegion(
                  onEnter: (_) => setState(() => _hoveredIndex = index),
                  onExit: (_) => setState(() => _hoveredIndex = -1),
                  child: GestureDetector(
                    onTap: () => _showImageOverlay(context, index),
                    child: Hero(
                      tag: 'project_image_${widget.project.title}_$index',
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(screenshots[index]),
                            fit: BoxFit.cover, // Changed to cover for better preview
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                  _hoveredIndex == index ? 0.4 : 0.1),
                              blurRadius: _hoveredIndex == index ? 12 : 4,
                              offset: const Offset(0, 3),
                              spreadRadius: _hoveredIndex == index ? 1 : 0,
                            ),
                          ],
                          border: Border.all(
                            color: _hoveredIndex == index
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                            width: _hoveredIndex == index ? 2 : 0,
                          ),
                        ),
                        transform: Matrix4.identity()
                          ..scale(_hoveredIndex == index ? 1.15 : 1.0),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),

        // Page Indicators with image count
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Page indicators
            if (hasMultiplePages)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(pageCount, (index) {
                  final isActive = (_currentPage / 4).floor() == index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: isActive ? 24 : 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: isActive
                          ? Theme.of(context).primaryColor
                          : Colors.grey.withOpacity(0.3),
                    ),
                  );
                }),
              )
            else
              const SizedBox(),

            // Image count badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${screenshots.length} images',
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Expanded(
      child: Scrollbar(
        controller: _descriptionScrollController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _descriptionScrollController,
          child: Text(
            widget.project.description,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.grey[700]),
          ),
        ),
      ),
    );
  }

  Widget _buildTechnologiesSection() {
    return SizedBox(
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.project.technologies.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 6),
            child: Chip(
              label: Text(
                widget.project.technologies[index],
                style: const TextStyle(fontSize: 11),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              backgroundColor:
              Theme.of(context).primaryColor.withOpacity(0.08),
              side: BorderSide.none,
            ),
          );
        },
      ),
    );
  }


  Widget _buildActionButtons() {
    return Row(
      children: [
        // GitHub Button
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _showGithubInfoDialog(context),
            icon: const Icon(Icons.lock_outline, size: 16),
            label: const Text('Private Repo'),
          )
        ),
        const SizedBox(width: 8),

        // Demo Button (if available)
        if (widget.project.demoVideoUrl != null)
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => _launchUrl(widget.project.demoVideoUrl!),
              icon: const Icon(Icons.play_circle_outline, size: 16),
              label: const Text('Demo'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
      ],
    );
  }
}