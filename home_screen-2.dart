import 'package:flutter/material.dart';
import 'cart.dart';
import 'wishlist.dart';
import 'account.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color purple = Color(0xFFEDE4FF); // Light purple background
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  final List<Map<String, String>> categoryData = [
    {'label': 'Pencils', 'url': 'https://th.bing.com/th/id/OIP.fzJPZr1N4Y_Xz0A_26QJOAHaHa?rs=1&pid=ImgDetMain'},
    {'label': 'Sketchbooks', 'url': 'https://th.bing.com/th/id/OIP.ArigPRkVVUThSkmCA8GmQgHaHa?rs=1&pid=ImgDetMain'},
    {'label': 'Paint Colors', 'url': 'https://th.bing.com/th/id/R.68844cd1fb304f37a2a1f6595ae44eef?rik=bS96q3a%2fU7Ne2g&riu=http%3a%2f%2fgratefulgrumbles.com%2fwp-content%2fuploads%2f2017%2f05%2fcropped-IMG_1277-1.jpg&ehk=TAQjsQIh9s%2bop4%2fujCaUQixSyNwcb0yDa0HilJq1OM0%3d&risl=&pid=ImgRaw&r=0'},
    {'label': 'Rulers', 'url': 'https://th.bing.com/th/id/R.0a879794f06c82d03dd597a7386114b5?rik=TvFnBsAefY39HQ&riu=http%3a%2f%2fwww.omghowcheap.co.uk%2fekmps%2fshops%2fomghowcheap%2fimages%2f12-coloured-rulers-pack-of-12-shatter-resistant-plastic-30cm-rulers-mixed-8803-p.jpg&ehk=dbD1gb%2fFulR6WqIU%2fu4Djv%2biFakx6zz8PNpWqLK8ZmU%3d&risl=&pid=ImgRaw&r=0'},
    {'label': 'Crayons', 'url': 'https://th.bing.com/th/id/OIP.m6rSUa4t8rol9YzYkPgxHwHaE7?rs=1&pid=ImgDetMain'},
    {'label': 'Highlighters', 'url': 'https://m.media-amazon.com/images/I/91T98vSMUtS._AC_SL1500_.jpg'},
  ];

  final List<Map<String, String>> popularPicks = [
    {'label': 'Marker Set', 'url': 'https://m.media-amazon.com/images/I/81SDj+lZaJL._AC_SL1500_.jpg'},
    {'label': 'Brush Kit', 'url': 'https://th.bing.com/th/id/OIP.0U2Jjlagnc4stFw47Cwj5AHaHa?rs=1&pid=ImgDetMain'},
    {'label': 'Oil Paints', 'url': 'https://th.bing.com/th/id/R.c701f222f69ebbd37a7901695fa5a9ec?rik=xi3uVvbE5ETB3w&pid=ImgRaw&r=0'},
    {'label': 'Acrylic Tubes', 'url': 'https://th.bing.com/th/id/R.1c7cae960ca773ac6c09ea6624edaa33?rik=vhOb8z8hxqdiLw&riu=http%3a%2f%2fstanleyplastics.co.uk%2fwp-content%2fuploads%2f2016%2f03%2fP1000519-e1485867896286.jpg&ehk=3l1yMBdLSS7JGptbtPGuvFE9HdYuTw7kPJMeMU9q2UY%3d&risl=&pid=ImgRaw&r=0'},
    {'label': 'Canvas Set', 'url': 'https://images.unsplash.com/photo-1529078155058-5d716f45d604'},
    {'label': 'Colored Pencils', 'url': 'https://scale.coolshop-cdn.com/product-media.coolshop-cdn.com/AF6498/290dc6c92ead43c8ae9edc621c487af3.jpg/f/faber-castell-colour-pencils-cardboard-box-48-pcs-112449.jpg'},
  ];

  void _nextPage() {
    setState(() {
      _currentPage = (_currentPage + 1) % categoryData.length;
      _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  void _previousPage() {
    setState(() {
      _currentPage = (_currentPage - 1 + categoryData.length) % categoryData.length;
      _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  void _goToCart(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
  }

  void _goToWishlist(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistScreen()));
  }

  void _goToAccount(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      backgroundColor: Color(0xFFF9F3FF), // light lavender background
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFE8D9FF), // slightly deeper purple
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey[600],
        onTap: (index) {
          if (index == 1) _goToCart(context);
          if (index == 2) _goToWishlist(context);
          if (index == 3) _goToAccount(context);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.arrow_back),
                    GestureDetector(
                      onTap: () => _goToCart(context),
                      child: Icon(Icons.shopping_cart_outlined),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text('Good Morning', style: TextStyle(fontSize: 14, color: Colors.black87)),
                const Text('Abdelrahman', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                const SizedBox(height: 10),

                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Categories Carousel
                const Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                const SizedBox(height: 12),
                Stack(
                  children: [
                    SizedBox(
                      height: 180,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: categoryData.length,
                        onPageChanged: (index) {
                          setState(() => _currentPage = index);
                        },
                        itemBuilder: (context, index) {
                          final data = categoryData[index];
                          return Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  data['url']!,
                                  height: 140,
                                  width: imageWidth,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(data['label']!, style: const TextStyle(fontSize: 14, color: Colors.black87)),
                            ],
                          );
                        },
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 60,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: _previousPage,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 60,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: _nextPage,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Popular Picks
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Popular picks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                    Icon(Icons.arrow_forward),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularPicks.length,
                    itemBuilder: (context, index) {
                      final item = popularPicks[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                item['url']!,
                                height: 120,
                                width: MediaQuery.of(context).size.width / 4 - 24,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(item['label']!, style: const TextStyle(fontSize: 12, color: Colors.black87)),
                          ],
                        ),
                      );
                    },
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
