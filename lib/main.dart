import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const NexusApp());
}

// --- CONSTANTES DE DISEÑO (Basadas en tu Tailwind Config) ---
class NexusColors {
  static const background = Color(0xFF0B1326);
  static const surface = Color(0xFF0B1326);
  static const surfaceVariant = Color(0xFF2D3449);
  static const surfaceContainer = Color(0xFF171F33);
  static const surfaceContainerLowest = Color(0xFF060E20);
  static const primary = Color(0xFFDBFCFF);
  static const primaryContainer = Color(0xFF00F0FF);
  static const onPrimaryContainer = Color(0xFF006970);
  static const onSurface = Color(0xFFDAE2FD);
  static const onSurfaceVariant = Color(0xFFB9CACB);
  static const outlineVariant = Color(0xFF3B494B);
}

class NexusApp extends StatelessWidget {
  const NexusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEXUS | Categories Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: NexusColors.background,
        colorScheme: const ColorScheme.dark(
          primary: NexusColors.primary,
          surface: NexusColors.surface,
        ),
        fontFamily: 'Inter',
      ),
      home: const NexusScaffold(),
    );
  }
}

class NexusScaffold extends StatelessWidget {
  const NexusScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          // Capa Base: Contenido Principal y Footer
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 256), // Espaciador para el Sidebar fijo
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 88), // Espaciador para el TopNav fijo
                      NexusHero(),
                      NexusBentoGrid(),
                      NexusFooter(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          // Capa Intermedia: Sidebar
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: NexusSidebar(),
          ),

          // Capa Superior: Top Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NexusTopNav(),
          ),
        ],
      ),
    );
  }
}

// --- COMPONENTES PRINCIPALES ---

class NexusTopNav extends StatelessWidget {
  const NexusTopNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          height: 88,
          decoration: BoxDecoration(
            color: NexusColors.surface.withOpacity(0.7),
            border: Border(bottom: BorderSide(color: NexusColors.outlineVariant.withOpacity(0.1))),
            boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 30, offset: Offset(0, 4))],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo y Links
              Row(
                children: [
                  const Text(
                    "NEXUS",
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 24, fontWeight: FontWeight.w800, color: NexusColors.primary, letterSpacing: -1),
                  ),
                  const SizedBox(width: 48),
                  _navLink("Action", isActive: true),
                  _navLink("RPG"),
                  _navLink("Indie"),
                  _navLink("Strategy"),
                  _navLink("Shooter"),
                  _navLink("Sports"),
                ],
              ),
              // Buscador y Acciones
              Row(
                children: [
                  _buildSearchBar(),
                  const SizedBox(width: 24),
                  _iconButton(Icons.shopping_cart_outlined),
                  const SizedBox(width: 16),
                  _iconButton(Icons.favorite_outline),
                  const SizedBox(width: 16),
                  _iconButton(Icons.account_circle_outlined),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _navLink(String text, {bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: Container(
        decoration: BoxDecoration(
          border: isActive ? const Border(bottom: BorderSide(color: NexusColors.primary, width: 2)) : null,
        ),
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.7, // 0.05em
            color: isActive ? NexusColors.primary : NexusColors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: 256,
      height: 40,
      decoration: BoxDecoration(
        color: NexusColors.surfaceVariant.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: NexusColors.outlineVariant.withOpacity(0.3)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.search, color: NexusColors.onSurfaceVariant, size: 18),
          const SizedBox(width: 12),
          Text("Search universe...", style: TextStyle(color: NexusColors.onSurfaceVariant.withOpacity(0.7), fontSize: 14)),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return Icon(icon, color: NexusColors.onSurfaceVariant, size: 24);
  }
}

class NexusSidebar extends StatelessWidget {
  const NexusSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          width: 256,
          padding: const EdgeInsets.only(top: 96), // Clears TopNav
          decoration: BoxDecoration(
            color: NexusColors.surfaceContainer.withOpacity(0.8),
            border: Border(right: BorderSide(color: NexusColors.outlineVariant.withOpacity(0.1))),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: NexusColors.surfaceVariant,
                            image: const DecorationImage(
                              image: NetworkImage("https://lh3.googleusercontent.com/aida-public/AB6AXuA9Y42T43HiZWkZfKLY_FZdh3aodJdxjdFgYqt2pvFlzsQbuf6Y_OEU2CZk82tYngMcllFE6stB0hiNaeB0e2yh2Tvoq_npAGS0xJG9ZiFzcsJyAv885Xtlk138k1sPVhTrNYejUOZDUBDoQ11irm0opFJESWeRZKu37T0InApPZ3t0a_gLV0AIMlhbyMb6HpzII2le4FOXkfANtW_d5UXBvhlMFIlKkR5fLDyg7BXWKpb6lz1eLcwDPGmnxLqAkMDP1n7C6sNDkS0"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pro Gamer", style: TextStyle(color: NexusColors.onSurface, fontSize: 14, fontWeight: FontWeight.w600)),
                            Text("ELITE TIER", style: TextStyle(color: NexusColors.primary, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: NexusColors.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Upgrade to Pro",
                        style: TextStyle(color: NexusColors.onPrimaryContainer, fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Navigation Items
              _sideNavItem(Icons.grid_view, "Library"),
              _sideNavItem(Icons.local_mall, "Store", isActive: true),
              _sideNavItem(Icons.sensors, "Live"),
              _sideNavItem(Icons.group_outlined, "Community"),
              _sideNavItem(Icons.download_outlined, "Downloads"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sideNavItem(IconData icon, String label, {bool isActive = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? NexusColors.primary.withOpacity(0.1) : Colors.transparent,
        border: isActive ? const Border(right: BorderSide(color: NexusColors.primary, width: 4)) : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Icon(icon, color: isActive ? NexusColors.primary : NexusColors.onSurfaceVariant, size: 24),
          const SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(
              color: isActive ? NexusColors.primary : NexusColors.onSurfaceVariant,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class NexusHero extends StatelessWidget {
  const NexusHero({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 64, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "EXPLORE\nCATEGORIES",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 64,
              fontWeight: FontWeight.w800,
              color: NexusColors.primary,
              height: 1.1,
              letterSpacing: -1.28,
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: 670, // max-w-2xl aprox
            child: Text(
              "Dive into curated universes. From the high-octane streets of neon cities to the silent depths of ancient strategy, find your next obsession.",
              style: TextStyle(fontSize: 18, color: NexusColors.onSurfaceVariant, height: 1.6),
            ),
          ),
        ],
      ),
    );
  }
}

class NexusBentoGrid extends StatelessWidget {
  const NexusBentoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 64, right: 64, bottom: 96),
      child: Column(
        children: [
          // Fila 1: Action (8 col) + Strategy (4 col)
          Row(
            children: [
              Expanded(
                flex: 8,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: BentoCard(
                    tag: "01 / Adrenaline",
                    title: "ACTION",
                    description: "Fast-paced combat, epic set pieces, and heart-pounding moments across multiple dimensions.",
                    imageUrl: "https://images.unsplash.com/photo-1542751371-adc38448a05e?q=80&w=2070",
                  ),
                ),
              ),
              const SizedBox(width: 24), // gap-gutter
              Expanded(
                flex: 4,
                child: AspectRatio(
                  aspectRatio: 1, // aspect-square para las celdas laterales
                  child: BentoCard(
                    tag: "02 / Tactical",
                    title: "STRATEGY",
                    imageUrl: "https://images.unsplash.com/photo-1614294148960-9aa740632a87?q=80&w=2070",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Fila 2: RPG (4 col) + Indie (4 col) + Shooter (4 col)
          Row(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: BentoCard(
                    tag: "03 / Narrative",
                    title: "RPG",
                    imageUrl: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?q=80&w=2069",
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: BentoCard(
                    tag: "04 / Unique",
                    title: "INDIE",
                    imageUrl: "https://images.unsplash.com/photo-1614728263952-84ea206f25bc?q=80&w=2070",
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: BentoCard(
                    tag: "05 / Precision",
                    title: "SHOOTER",
                    imageUrl: "https://images.unsplash.com/photo-1552820728-8b83bb6b773f?q=80&w=2070",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Fila 3: Sports (12 col)
          AspectRatio(
            aspectRatio: 21 / 9,
            child: BentoCard(
              tag: "06 / Competition",
              title: "SPORTS & RACING",
              imageUrl: "https://images.unsplash.com/photo-1511447333015-45b65e60f6d5?q=80&w=2055",
              trailingWidget: _buildGlassBadge(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassBadge() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          decoration: BoxDecoration(
            color: NexusColors.surfaceContainer.withOpacity(0.4),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: NexusColors.primary.withOpacity(0.1)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: const Text(
            "248 TITLES AVAILABLE",
            style: TextStyle(color: NexusColors.primary, fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.7),
          ),
        ),
      ),
    );
  }
}

// Widget Reutilizable para las Tarjetas Bento con Interacciones
class BentoCard extends StatefulWidget {
  final String tag;
  final String title;
  final String? description;
  final String imageUrl;
  final Widget? trailingWidget;

  const BentoCard({
    super.key,
    required this.tag,
    required this.title,
    required this.imageUrl,
    this.description,
    this.trailingWidget,
  });

  @override
  State<BentoCard> createState() => _BentoCardState();
}

class _BentoCardState extends State<BentoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered ? const Color(0xFF00F0FF).withOpacity(0.3) : Colors.transparent,
            width: 1,
          ),
          boxShadow: _isHovered
              ? [BoxShadow(color: const Color(0xFF00F0FF).withOpacity(0.15), blurRadius: 30, spreadRadius: 0)]
              : [],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Imagen de Fondo con efecto de escala
            AnimatedScale(
              scale: _isHovered ? 1.05 : 1.0,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOutCubic,
              child: Image.network(widget.imageUrl, fit: BoxFit.cover),
            ),
            // Gradiente oscuro superpuesto
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [NexusColors.background, Colors.transparent],
                  stops: [0.0, 0.9],
                ),
              ),
            ),
            // Contenido Textual
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.tag,
                              style: const TextStyle(
                                color: NexusColors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.4, // 0.2em approx
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.title,
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: -0.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (widget.trailingWidget != null) widget.trailingWidget!,
                    ],
                  ),
                  if (widget.description != null) ...[
                    AnimatedOpacity(
                      opacity: _isHovered ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          widget.description!,
                          style: const TextStyle(color: NexusColors.onSurfaceVariant, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NexusFooter extends StatelessWidget {
  const NexusFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: NexusColors.surfaceContainerLowest,
        border: Border(top: BorderSide(color: NexusColors.outlineVariant.withOpacity(0.1))),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo & Copyright
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "NEXUS",
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 24, fontWeight: FontWeight.w800, color: NexusColors.primary, letterSpacing: -1),
              ),
              const SizedBox(height: 16),
              Text(
                "© 2024 NEXUS GAMING CATALOG. BEYOND IMMERSION.",
                style: TextStyle(color: NexusColors.onSurfaceVariant.withOpacity(0.6), fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          // Links
          Row(
            children: [
              _footerColumn("Platform", ["Support", "Partners"]),
              const SizedBox(width: 48),
              _footerColumn("Legal", ["Privacy", "Terms"]),
              const SizedBox(width: 48),
              // Social Icons
              Row(
                children: [
                  _socialIcon(Icons.public),
                  const SizedBox(width: 16),
                  _socialIcon(Icons.share),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _footerColumn(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: NexusColors.onSurface, fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        ...links.map((link) => Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(link, style: TextStyle(color: NexusColors.onSurfaceVariant.withOpacity(0.6), fontSize: 12)),
        )),
      ],
    );
  }

  Widget _socialIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: NexusColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Icon(icon, color: NexusColors.onSurfaceVariant, size: 18),
    );
  }
}