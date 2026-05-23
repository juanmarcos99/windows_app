import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFDBFCFF),
        scaffoldBackgroundColor: const Color(0xFF0B1326),
        fontFamily: 'Montserrat',
      ),
      home: const NexusCategoryPage(),
    );
  }
}

class NexusCategoryPage extends StatelessWidget {
  const NexusCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          _buildSidebar(),
          // Contenido Principal
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 40),
                    _buildBentoGrid(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 250,
      color: const Color(0xFF171F33),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text("NEXUS", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFDBFCFF))),
          ),
          _sidebarItem(Icons.grid_view, "Library"),
          _sidebarItem(Icons.local_mall, "Store", isSelected: true),
          _sidebarItem(Icons.sensors, "Live"),
        ],
      ),
    );
  }

  Widget _sidebarItem(IconData icon, String title, {bool isSelected = false}) {
    return Container(
      color: isSelected ? const Color(0xFFDBFCFF).withOpacity(0.1) : null,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? const Color(0xFFDBFCFF) : Colors.grey),
          const SizedBox(width: 15),
          Text(title, style: TextStyle(color: isSelected ? const Color(0xFFDBFCFF) : Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("EXPLORE\nCATEGORIES", style: TextStyle(fontSize: 56, fontWeight: FontWeight.w900, color: Color(0xFFDBFCFF), height: 1.0)),
        SizedBox(height: 20),
        Text("Dive into curated universes. Find your next obsession.", style: TextStyle(fontSize: 18, color: Colors.grey)),
      ],
    );
  }

  Widget _buildBentoGrid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 1.2,
      children: [
        _categoryCard("ACTION", "https://images.unsplash.com/photo-1542751371-adc38448a05e?q=80&w=600"),
        _categoryCard("STRATEGY", "https://images.unsplash.com/photo-1614294148960-9aa740632a87?q=80&w=600"),
        _categoryCard("RPG", "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?q=80&w=600"),
      ],
    );
  }

  Widget _categoryCard(String title, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [Colors.black.withOpacity(0.8), Colors.transparent], begin: Alignment.bottomCenter),
        ),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.bottomLeft,
        child: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}