import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ink = BrutalPalette.ink;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UAS',
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: BrutalPalette.bg,
        appBarTheme: AppBarTheme(
          backgroundColor: BrutalPalette.yellow,
          foregroundColor: ink,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: ink,
          ),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: ink,
              displayColor: ink,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: BrutalPalette.blue,
            foregroundColor: ink,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              letterSpacing: .2,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(color: Colors.black, width: 2.5),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          prefixIconColor: Colors.black,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.black, width: 2.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.black, width: 2.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: BrutalPalette.blue, width: 3),
          ),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      home: const LoginPage(),
      routes: {
        '/dashboard': (_) => const DashboardPage(),
        '/profile': (_) => const ProfilePage(),
        '/data': (_) => const DataPage(),
        '/settings': (_) => const SettingsPage(),
      },
    );
  }
}

class BrutalPalette {
  static const bg = Color(0xFFF7F7F2);
  static const ink = Color(0xFF121212);
  static const mint = Color(0xFF06D6A0);
  static const yellow = Color(0xFFFFD166);
  static const blue = Color(0xFF118AB2);
  static const pink = Color(0xFFEF476F);
}

class BrutalBox extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double? height;
  final double? width;
  final AlignmentGeometry alignment;
  const BrutalBox({
    super.key,
    required this.child,
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(16),
    this.margin = EdgeInsets.zero,
    this.height,
    this.width,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: BrutalPalette.ink, width: 2.5),
        boxShadow: const [
          BoxShadow(
            color: BrutalPalette.ink,
            offset: Offset(6, 6),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Masuk untuk melanjutkan ke aplikasi Anda.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const BrutalBox(
                      color: BrutalPalette.yellow,
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.tag_faces, size: 48),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: BrutalBox(
                        color: BrutalPalette.mint,
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Icon(Icons.info_outline),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'login',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email atau Username',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/dashboard',
                        arguments: {'name': 'nabil ulil albab'},
                      );
                    },
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(height: 12),
                const Center(
                  child: Text(
                    'Versi 1.0.0',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final name =
        args != null && args['name'] is String ? args!['name'] as String : 'nabil ulil albab';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
         IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tidak ada notifikasi (dummy)')),
              );
            },
            icon: const Icon(Icons.notifications_none),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo, $name',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 16),
            BrutalBox
            (
              color: BrutalPalette.mint,
              height: 140,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: BrutalPalette.ink,
                        width: 2.5,
                      ),
                    ),
                    child: const Icon(Icons.landscape, size: 56),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Selamat datang kembali!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Ini adalah banner dummy. Nikmati UI bergaya brutalism yang tegas dengan warna lembut.',
                          style: TextStyle(
                            height: 1.25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Menu',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _MenuTile(
                  icon: Icons.person,
                  label: 'Profil',
                  color: BrutalPalette.yellow,
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                _MenuTile(
                  icon: Icons.list_alt,
                  label: 'Data',
                  color: BrutalPalette.pink,
                  onTap: () {
                    Navigator.pushNamed(context, '/data');
                  },
                ),
                _MenuTile(
                  icon: Icons.settings,
                  label: 'Pengaturan',
                  color: BrutalPalette.blue,
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const _MenuTile({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: BrutalBox(
        color: color,
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: BrutalPalette.ink),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: BrutalPalette.pink,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: BrutalBox(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.black12,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: BrutalPalette.ink,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'nabil ulil albab',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const BrutalBox(
              color: BrutalPalette.yellow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ProfileRow(title: 'NIM / ID', value: '23670010'),
                  SizedBox(height: 8),
                  _ProfileRow(title: 'Email', value: '23670010@upgris.ac.id'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Expanded(
                  child: BrutalBox(
                    color: BrutalPalette.mint,
                    child: _ProfileRow(title: 'Prodi', value: 'Informatika'),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: BrutalBox(
                    color: BrutalPalette.blue,
                    child: _ProfileRow(title: 'Semester', value: '5'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali ke Dashboard'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileRow extends StatelessWidget {
  final String title;
  final String value;
  const _ProfileRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}


class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifikasi dummy pada halaman Data')),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BrutalBox(
              color: BrutalPalette.yellow,
              child: Row(
                children: [
                  Icon(Icons.info_outline),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Berikut adalah data dummy dalam gaya brutalism.',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: const [
                _DataTile(icon: Icons.article, label: 'Artikel Dummy'),
                _DataTile(icon: Icons.inventory_2, label: 'Item Dummy'),
                _DataTile(icon: Icons.assignment, label: 'Tugas Dummy'),
                _DataTile(icon: Icons.people, label: 'User Dummy'),
                _DataTile(icon: Icons.map, label: 'Lokasi Dummy'),
                _DataTile(icon: Icons.timeline, label: 'Statistik Dummy'),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DataTile extends StatelessWidget {
  final IconData icon;
  final String label;
  const _DataTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return BrutalBox(
      color: BrutalPalette.mint,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: BrutalPalette.ink),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool dummySwitchTema = true;
    bool dummySwitchHematData = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifikasi dummy pada halaman Pengaturan')),
              );
            },
            icon: const Icon(Icons.notifications_none),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pengaturan Dummy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 12),
            BrutalBox(
              color: BrutalPalette.yellow,
              child: Column(
                children: [
                  _SettingRow(
                    title: 'Tema Dummy',
                    trailing: Switch(
                      value: dummySwitchTema,
                      onChanged: (_) {},
                    ),
                  ),
                  const SizedBox(height: 8),
                  _SettingRow(
                    title: 'Mode Hemat Data (Dummy)',
                    trailing: Switch(
                      value: dummySwitchHematData,
                      onChanged: (_) {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Expanded(
                  child: BrutalBox(
                    color: BrutalPalette.mint,
                    child: _SettingInfo(title: 'Versi', value: '1.0.0 (dummy)'),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: BrutalBox(
                    color: BrutalPalette.blue,
                    child: _SettingInfo(title: 'Build', value: '#12345 (dummy)'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingRow extends StatelessWidget {
  final String title;
  final Widget trailing;
  const _SettingRow({required this.title, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.settings, size: 24),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        trailing,
      ],
    );
  }
}

class _SettingInfo extends StatelessWidget {
  final String title;
  final String value;
  const _SettingInfo({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
