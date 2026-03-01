import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Color _greenIcon = const Color.fromARGB(209, 9, 203, 102);

  final List<Map<String, dynamic>> _menuItems = [
    {'icon': Icons.person_outline, 'label': 'About Me', 'route': 'about-me'},
    {'icon': Icons.shopping_bag_outlined, 'label': 'My Order', 'route': null},
    {
      'icon': Icons.favorite_outline,
      'label': 'Favorites',
      'route': 'favorites',
    },
    {
      'icon': Icons.credit_card_outlined,
      'label': 'Debit Card',
      'route': 'credit-card',
    },
    {'icon': Icons.location_on_outlined, 'label': 'My Address', 'route': null},
    {
      'icon': Icons.receipt_long_outlined,
      'label': 'Transactions',
      'route': null,
    },
    {
      'icon': Icons.notifications_outlined,
      'label': 'Notifications',
      'route': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: const Color.fromARGB(255, 240, 240, 240),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Foto
                ClipOval(
                  child: Image(
                    width: 150,
                    height: 150,
                    image: AssetImage('assets/profile_image.png'),
                  ),
                ),
                const SizedBox(height: 16),

                const Text(
                  'Emiliano Valencia',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),

                const Text(
                  '@emival',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 14),

                // Puntos
                Text(
                  '0 Runtah Points',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: _greenIcon,
                  ),
                ),
                const SizedBox(height: 28),

                // Encabezado FUERA del contenedor
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Información de usuario',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: _menuItems.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      final isLast = index == _menuItems.length - 1;

                      return Column(
                        children: [
                          ListTile(
                            leading: Icon(item['icon'], color: _greenIcon),
                            title: Text(
                              item['label'],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.chevron_right,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              try {
                                if (item['route'] != null) {
                                  Navigator.pushNamed(context, item['route']);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('No disponible')),
                                  );
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('No disponible')),
                                );
                              }
                            },
                          ),
                          if (!isLast)
                            const Divider(height: 1, indent: 16, endIndent: 16),
                        ],
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: NotchBottomBarController(),
        onTap: (i) {
          switch (i) {
            case 0:
              Navigator.pushNamed(context, 'profile');
              break;
            case 1:
              Navigator.pushNamed(context, 'favorites');
              break;
            case 2:
              Navigator.pushNamed(context, 'credit-card');
              break;
          }
        },
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(Icons.person, color: Colors.blueGrey),
            activeItem: Icon(Icons.person, color: Colors.blueAccent),
            itemLabel: 'Profile',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.star, color: Colors.blueGrey),
            activeItem: Icon(Icons.star, color: Colors.blueAccent),
            itemLabel: 'Favorites',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.credit_card, color: Colors.blueGrey),
            activeItem: Icon(Icons.credit_card, color: Colors.blueAccent),
            itemLabel: 'Card',
          ),
        ],
        kIconSize: 25,
        kBottomRadius: 10,
      ),
    );
  }
}
