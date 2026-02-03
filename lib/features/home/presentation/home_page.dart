import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/widgets/project_card.dart';
import '../../../core/widgets/skill_card.dart';
import '../../../data_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isScrolled = _scrollController.offset > 100;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // App Bar
          SliverAppBar(
            expandedHeight: 120,
            floating: true,
            pinned: true,
            backgroundColor: _isScrolled
                ? const Color(0xFF0F172A).withOpacity(0.95)
                : Colors.transparent,
            surfaceTintColor: Colors.transparent,
            title: _isScrolled
                ? const Text(
              'Saad Ebad',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            )
                : null,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Saad Ebad',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        _buildNavItem('Home'),
                        _buildNavItem('Skills'),
                        _buildNavItem('Projects'),
                        _buildNavItem('Contact'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Hero Section
          SliverToBoxAdapter(
            child: _buildHeroSection(),
          ),

          // Skills Section
          SliverToBoxAdapter(
            child: _buildSkillsSection(),
          ),

          // Projects Section
          SliverToBoxAdapter(
            child: _buildProjectsSection(),
          ),

          // Footer
          SliverToBoxAdapter(
            child: _buildFooter(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () {
          // Add scroll to section functionality
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Picture
          Container(
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF42A5F5),
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF42A5F5).withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'dp/dp.jpg', // Replace with your image URL
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFF1E293B),
                    child: const Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 80),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Muhammad Saad Ebad',
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Flutter Developer',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF42A5F5),
                        ),
                      ),
                      TextSpan(
                        text: ' | Mobile & Cross-Platform Solutions',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'I help turn ideas into polished Flutter apps users love.\n\n'
                      'With a strong focus on architecture, performance, and intelligent features, '
                      'I build applications that are reliable, scalable, and ready to grow. '
                      'I’ve worked on real-world client projects and understand what it takes to ship '
                      'production-quality software.',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFFCBD5E1),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        launchUrl(Uri.parse('https://github.com/saadebad'));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF02569B),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.code, size: 20),
                          SizedBox(width: 8),
                          Text('View GitHub'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton(
                      onPressed: () {
                        _showContactDialog();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF42A5F5)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.email, size: 20),
                          SizedBox(width: 8),
                          Text('Contact Me'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Quick Stats
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatItem('4+', 'Years Experience'),
                    _buildStatItem('Real-World', 'Client Projects'),
                    _buildStatItem('Clean', 'Architecture Focus'),
                    _buildStatItem('AI-Ready', 'Flutter Apps'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Color(0xFF42A5F5),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: const Color(0xFF1E293B),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Technical Skills',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Technologies I work with to build amazing applications',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFCBD5E1),
            ),
          ),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.2,
            ),
            itemCount: DataRepository.skills.length,
            itemBuilder: (context, index) {
              return SkillCard(skill: DataRepository.skills[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured Projects',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'A showcase of my recent Flutter projects',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFCBD5E1),
            ),
          ),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.8,
            ),
            itemCount: DataRepository.projects.length,
            itemBuilder: (context, index) {
              return EnhancedProjectCard(project: DataRepository.projects[index]);
            },
          ),
          const SizedBox(height: 48),
          /*Center(
            child: ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse('https://github.com/saadebad'));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF02569B),
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 20,
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_forward, size: 20),
                  SizedBox(width: 12),
                  Text(
                    'View All Projects on GitHub',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),*/
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      color: const Color(0xFF0A1128),
      child: Column(
        children: [
          const Text(
            'Let\'s Build Something Amazing Together',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          const Text(
            'I\'m always open to discussing new opportunities and interesting projects.',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFCBD5E1),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(
                Icons.email,
                'mailto:saadebad01@gmail.com',
              ),
              _buildSocialIcon(
                Icons.phone,
                'tel:+923035273505',
              ),
              _buildSocialIcon(
                Icons.link,
                'https://www.linkedin.com/in/saadebad',
              ),
              _buildSocialIcon(
                Icons.code,
                'https://github.com/saadebad',
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Divider(color: Color(0xFF334155)),
          const SizedBox(height: 24),
          Text(
            '© ${DateTime.now().year} Muhammad Saad Ebad. All rights reserved.',
            style: const TextStyle(
              color: Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: IconButton(
        onPressed: () {
          launchUrl(Uri.parse(url));
        },
        icon: Icon(icon, size: 28),
        color: const Color(0xFF42A5F5),
        style: IconButton.styleFrom(
          backgroundColor: const Color(0xFF1E293B),
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  void _showContactDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E293B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Contact Information',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildContactItem(
                  Icons.person,
                  'Muhammad Saad Ebad',
                ),
                const SizedBox(height: 16),
                _buildContactItem(
                  Icons.phone,
                  '+92 303 5273505',
                  onTap: () {
                    launchUrl(Uri.parse('tel:+923035273505'));
                  },
                ),
                const SizedBox(height: 16),
                _buildContactItem(
                  Icons.email,
                  'saadebad01@gmail.com',
                  onTap: () {
                    launchUrl(Uri.parse('mailto:saadebad01@gmail.com'));
                  },
                ),
                const SizedBox(height: 16),
                _buildContactItem(
                  Icons.link,
                  'LinkedIn: https://www.linkedin.com/in/saadebad',
                  onTap: () {
                    launchUrl(Uri.parse('https://www.linkedin.com/in/saadebad'));
                  },
                ),
                const SizedBox(height: 16),
                _buildContactItem(
                  Icons.code,
                  'GitHub: https://github.com/saadebad',
                  onTap: () {
                    launchUrl(Uri.parse('https://github.com/saadebad'));
                  },
                ),
                const SizedBox(height: 32),
                const Text(
                  'Available for:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildChip('Full-time Positions'),
                    _buildChip('Contract Work'),
                    _buildChip('Project-based Work'),
                    _buildChip('Technical Consulting'),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContactItem(IconData icon, String text, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF42A5F5), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFFCBD5E1),
                fontSize: 16,
              ),
            ),
          ),
          if (onTap != null)
            const Icon(
              Icons.arrow_outward,
              color: Color(0xFF42A5F5),
              size: 16,
            ),
        ],
      ),
    );
  }

  Widget _buildChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF02569B).withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF42A5F5).withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF42A5F5),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}