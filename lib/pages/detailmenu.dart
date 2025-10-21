import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/widgets/shared_button.dart';
import 'package:heroicons/heroicons.dart';

class DetailsMenu extends StatefulWidget {
  const DetailsMenu({super.key});

  @override
  State<DetailsMenu> createState() => _DetailsMenuState();
}

class _DetailsMenuState extends State<DetailsMenu> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController(); // ✅ Nama yang benar

  final List<Widget> foodImage = [
    Image.asset("images/image.png", fit: BoxFit.cover),
    Image.asset("images/image.png", fit: BoxFit.cover),
    Image.asset("images/image.png", fit: BoxFit.cover),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: HeroIcon(HeroIcons.heart, style: HeroIconStyle.outline),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Gunakan Stack untuk Positioned
          Stack(
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                items: foodImage,
                options: CarouselOptions(
                  height: 250, // ✅ Tambahkan height
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),

              // Indicator dots
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      foodImage.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _carouselController, // ✅ Panggil fungsi
                          child: Container(
                            width: _currentIndex == entry.key ? 12 : 8,
                            height: 8,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color:
                                  _currentIndex == entry.key
                                      ? Colors.orange
                                      : Colors.grey.withOpacity(0.7),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),

              // Counter gambar
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_currentIndex + 1}/${foodImage.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Konten lainnya bisa ditambahkan di sini
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Veggie Tomato Mix',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '50.000',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 250, 74, 12),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Info',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Delivered between monday aug and thursday 20 from 8pm to 91:32 pm',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Return policy',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: SharedButton(text: "Add to Cart", onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
