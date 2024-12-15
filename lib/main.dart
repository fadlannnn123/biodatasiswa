import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Siswa',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue, // Mengubah warna utama aplikasi menjadi biru muda
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white, // Background putih bersih
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black87), // Menetapkan warna teks default
        ),
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  final List<Student> students = [
    Student('Budi Santoso', '1234567890', 'XII IPA 1', 'Jl. Merdeka No. 12, Jakarta', '081234567890', 'https://via.placeholder.com/150'),
    Student('Siti Aminah', '1234567891', 'XII IPA 2', 'Jl. Raya No. 45, Bandung', '081234567891', 'https://via.placeholder.com/150'),
    Student('Agus Prasetyo', '1234567892', 'XII IPA 3', 'Jl. Kebangsaan No. 23, Surabaya', '081234567892', 'https://via.placeholder.com/150'),
    Student('Joko Widodo', '1234567893', 'XII IPS 1', 'Jl. Pahlawan No. 7, Yogyakarta', '081234567893', 'https://via.placeholder.com/150'),
    Student('Rina Hartini', '1234567894', 'XII IPA 1', 'Jl. Sejahtera No. 88, Medan', '081234567894', 'https://via.placeholder.com/150'),
    Student('Fikri Aditya', '1234567895', 'XII IPS 2', 'Jl. Pemuda No. 32, Bali', '081234567895', 'https://via.placeholder.com/150'),
    Student('Rizki Maulana', '1234567896', 'XII IPA 3', 'Jl. Raya No. 12, Makassar', '081234567896', 'https://via.placeholder.com/150'),
    Student('Lina Pertiwi', '1234567897', 'XII IPS 1', 'Jl. Merdeka No. 5, Jakarta', '081234567897', 'https://via.placeholder.com/150'),
    Student('Dwi Prasetya', '1234567898', 'XII IPA 2', 'Jl. Raya No. 30, Bandung', '081234567898', 'https://via.placeholder.com/150'),
    Student('Sarah Putri', '1234567899', 'XII IPS 2', 'Jl. Bahagia No. 50, Surabaya', '081234567899', 'https://via.placeholder.com/150'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent, // Mengubah AppBar menjadi biru cerah
        title: Text('Dashboard Siswa'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.white, // Card dengan latar belakang putih
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(students[index].imageUrl),
                  radius: 30,
                ),
                title: Text(
                  students[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87),
                ),
                subtitle: Text(
                  'Kelas: ${students[index].className}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent), // Warna ikon menjadi biru cerah
                onTap: () {
                  // Navigasi ke halaman detail siswa
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentDetailPage(student: students[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class Student {
  final String name;
  final String nis;
  final String className;
  final String address;
  final String contact;
  final String imageUrl;

  Student(this.name, this.nis, this.className, this.address, this.contact, this.imageUrl);
}

class StudentDetailPage extends StatelessWidget {
  final Student student;

  StudentDetailPage({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent, // AppBar dengan warna biru cerah
        title: Text('${student.name} - Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(student.imageUrl),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nama: ${student.name}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 10),
            Text(
              'NIS: ${student.nis}',
              style: TextStyle(fontSize: 18, color: Colors.grey[800]),
            ),
            SizedBox(height: 10),
            Text(
              'Kelas: ${student.className}',
              style: TextStyle(fontSize: 18, color: Colors.grey[800]),
            ),
            SizedBox(height: 10),
            Text(
              'Alamat: ${student.address}',
              style: TextStyle(fontSize: 18, color: Colors.grey[800]),
            ),
            SizedBox(height: 10),
            Text(
              'Kontak: ${student.contact}',
              style: TextStyle(fontSize: 18, color: Colors.grey[800]),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Warna tombol biru cerah
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text('Kembali ke Dashboard', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
