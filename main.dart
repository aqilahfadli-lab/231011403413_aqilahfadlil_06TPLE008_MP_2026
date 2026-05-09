import 'package:flutter/material.dart';

void main() {
  runApp(const WorkshopApp());
}

class WorkshopApp extends StatelessWidget {
  const WorkshopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workshop App Pro',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F172A),
          primary: const Color(0xFF2563EB),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // AppBar Modern dengan Nama Baru: Aqilah Fadlil
          SliverAppBar(
            expandedHeight: 120.0,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF0F172A),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Workshop IT - Aqilah Fadlil',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, Aqilah Fadlil',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey.shade900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Daftar pemaparan materi workshop teknologi terbaru.',
                    style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
          ),

          // Daftar Workshop dengan Materi Baru
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const KartuWorkshop(
                  judul: 'Cloud Computing: Implementasi AWS & Google Cloud',
                  tanggal: 'Senin, 18 Mei 2026',
                  lokasi: 'Lab Cloud Computing',
                  kuota: 'Tersedia 10 Kursi',
                  isPenuh: false,
                ),
                const KartuWorkshop(
                  judul: 'Backend Engineering: Arsitektur Microservices dengan Node.js',
                  tanggal: 'Selasa, 19 Mei 2026',
                  lokasi: 'Ruang Teater Fasilkom',
                  kuota: 'Kuota Penuh',
                  isPenuh: true,
                ),
                const KartuWorkshop(
                  judul: 'Mastering Flutter: Build Cross-Platform Apps in Record Time',
                  tanggal: 'Rabu, 20 Mei 2026',
                  lokasi: 'Lab Mobile App',
                  kuota: 'Tersedia 4 Kursi',
                  isPenuh: false,
                ),
                const KartuWorkshop(
                  judul: 'Data Science: Analisis Prediktif Menggunakan Python',
                  tanggal: 'Kamis, 21 Mei 2026',
                  lokasi: 'Auditorium Digital',
                  kuota: 'Tersedia 12 Kursi',
                  isPenuh: false,
                ),
                const KartuWorkshop(
                  judul: 'Cyber Security: Ethical Hacking & Vulnerability Assessment',
                  tanggal: 'Jumat, 22 Mei 2026',
                  lokasi: 'Pusat Riset Siber',
                  kuota: 'Kuota Penuh',
                  isPenuh: true,
                ),
                const KartuWorkshop(
                  judul: 'DevOps Lifecycle: Automating with Docker & Kubernetes',
                  tanggal: 'Sabtu, 23 Mei 2026',
                  lokasi: 'Lab Infrastruktur',
                  kuota: 'Tersedia 6 Kursi',
                  isPenuh: false,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class KartuWorkshop extends StatelessWidget {
  final String judul;
  final String tanggal;
  final String lokasi;
  final String kuota;
  final bool isPenuh;

  const KartuWorkshop({
    super.key,
    required this.judul,
    required this.tanggal,
    required this.lokasi,
    required this.kuota,
    required this.isPenuh,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 6,
                color: isPenuh ? Colors.red.shade400 : Colors.blue.shade600,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        judul,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.calendar_today_outlined, color: Colors.blue.shade600, size: 16),
                          const SizedBox(width: 8),
                          Text(tanggal, style: const TextStyle(fontSize: 13, color: Colors.blueGrey)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.map_outlined, color: Colors.blue.shade600, size: 16),
                          const SizedBox(width: 8),
                          Text(lokasi, style: const TextStyle(fontSize: 13, color: Colors.blueGrey)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: isPenuh ? Colors.red.shade50 : Colors.green.shade50,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              kuota,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: isPenuh ? Colors.red.shade700 : Colors.green.shade700,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: isPenuh ? null : () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2563EB),
                              foregroundColor: Colors.white,
                              disabledBackgroundColor: Colors.grey.shade200,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Daftar', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}