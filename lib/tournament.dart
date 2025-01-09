import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tournaments',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const TournamentsPage(),
    );
  }
}

class TournamentsPage extends StatelessWidget {
  const TournamentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tournaments = [
      {
        'title': 'FIVB Volleyball World Gr...',
        'subtitle': "Men's Volley Ball",
        'icon': Icons.male,
        'filled': '0/10',
        'date': '1 SEPTEMBER 2023·06:00',
        'location': 'Nehru Stadium',
        'imageUrl': 'https://via.placeholder.com/400x200',
      },
      {
        'title': 'FIVB Volleyball World Gr...',
        'subtitle': "Women's Volley Ball",
        'icon': Icons.female,
        'filled': '0/10',
        'date': '1 SEPTEMBER 2023·06:00',
        'location': 'Nehru Stadium',
        'imageUrl': 'https://via.placeholder.com/400x200',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tournaments'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const TabBarWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: tournaments.length,
              itemBuilder: (context, index) {
                final tournament = tournaments[index];
                return TournamentCard(
                  title: tournament['title'] as String,
                  subtitle: tournament['subtitle'] as String,
                  icon: tournament['icon'] as IconData,
                  filled: tournament['filled'] as String,
                  date: tournament['date'] as String,
                  location: tournament['location'] as String,
                  imageUrl: tournament['imageUrl'] as String,
                );
              },
            ),
          ),

        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          TabItem(label: 'ALL', isSelected: true),
          TabItem(label: 'BOOKMARKS', isSelected: false),
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;

  const TabItem({required this.label, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.white60,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

class TournamentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String filled;
  final String date;
  final String location;
  final String imageUrl;

  const TournamentCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.filled,
    required this.date,
    required this.location,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'OPEN',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(icon, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(subtitle, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Filled: $filled', style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(date, style: const TextStyle(color: Colors.grey)),
                    Text(location, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Teams',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.handshake),
          label: 'Participation',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'Host',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_events),
          label: 'Tournaments',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
