import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مكتبة قصص الأنبياء',
    
      theme: ThemeData(
        primarySwatch: Colors.brown,
        useMaterial3: true,
      ),
      home: const BooksScreen(),
    );
  }
}

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7CCC8),
      appBar: AppBar(
        title: const Text("مكتبة قصص الأنبياء"),
        centerTitle: true,
        backgroundColor: const Color(0xFF8D6E63),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            
            const Text(
              "اختر قصة لتقرأها",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF5D4037)),
            ),
            const SizedBox(height: 40),

            // زر الكتاب الأول: قصة يوسف
            buildBookButton(
              context, 
              title: "قصة يوسف عليه السلام", 
              content: "تبدأ برؤيا، وتمر ببئر مظلمة، ثم سجن، وتنتهي بعرش مصر. قصة تعلمنا أن تدبير الله فوق كل تدبير، وأن الصبر مفتاح الفرج."
            ),

            const SizedBox(height: 20),

            // زر الكتاب الثاني: قصة سليمان
            buildBookButton(
              context, 
              title: "قصة سليمان عليه السلام", 
              content: "سخر الله له الريح والجن، وعلمه لغة الطير. ملكٌ لم يؤتَ لأحد من بعده، ومع ذلك كان عبداً شكوراً يحكم بالعدل بين الخلق."
            ),
          ],
        ),
      ),
    );
  }


  Widget buildBookButton(BuildContext context, {required String title, required String content}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6D4C41),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: () async {
        
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailsScreen(bookName: title, bookContent: content),
          ),
        );

        
        if (result != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result),
              backgroundColor: const Color(0xFF5D4037),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  final String bookName;
  final String bookContent;

  const BookDetailsScreen({
    super.key, 
    required this.bookName, 
    required this.bookContent
  });


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC), 
      appBar: AppBar(title: const Text("صفحة القراءة"),
        backgroundColor: const Color(0xFF8D6E63),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bookName,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF5D4037)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                bookContent,
                style: const TextStyle(fontSize: 20, height: 1.5, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            
            
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8D6E63),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              ),
             
              child: const Text("عودة"),
              onPressed: () {
                
                Navigator.pop(context, " أكملت قراءة $bookName");
              },
            ),
          ],
        ),
      ),
    );
  }
}