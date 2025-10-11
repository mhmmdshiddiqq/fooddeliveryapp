import 'package:flutter/material.dart';
import 'package:food_deliver/widgets/shared_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _searchController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context){
          return IconButton(onPressed: () {
            Scaffold.of(context).openDrawer();
          }, icon: Icon(Icons.menu));
        }),
        actions: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
        
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Delicious \nfood for You",
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.w900),
              ),
            ),
            SharedTextfield(
              title: "Search",
              controller: _searchController,
              prefixIcon: Icon(Icons.search),
            ),
            SizedBox(height: 20),
            AnimatedBuilder(
              animation: _tabController,
              builder: (context, child) {
                return TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 250, 74, 12),
                      width: 3.0,
                    ),
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(text: 'Food'),
                    Tab(text: 'Drinks'),
                    Tab(text: 'Snacks'),
                    Tab(text: 'Sauces'),
                  ],
                );
              },
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 400,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildSectionFood(context),
                  _buildSectionDrinks(context),
                  _buildSectionSnacks(context),
                  _buildSectionSauces(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionFood(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "See more",
              style: TextStyle(color: Color.fromARGB(255, 250, 74, 12)),
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 180,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Container(
                  width: 150,
                  height: 180,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.asset('images/image.png', height: 200, width: 200),
                      Text(
                        "Card \nFood 1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Rp 10.000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 250, 74, 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: 180,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Container(
                  width: 150,
                  height: 180,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.asset('images/image.png', height: 200, width: 200),
                      Text(
                        "Card \nFood 1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Rp 10.000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 250, 74, 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: 180,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Container(
                  width: 150,
                  height: 180,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.asset('images/image.png', height: 200, width: 200),
                      Text(
                        "Card \nFood 1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Rp 10.000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 250, 74, 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionDrinks(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        Card(child: Text("Card Drinks 2")),
        Card(child: Text("Card Drinks 2")),
        Card(child: Text("Card Drinks 2")),
        Card(child: Text("Card Drinks 2")),
        Card(child: Text("Card Drinks 2")),
      ],
    );
  }

  Widget _buildSectionSnacks(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        Card(child: Text("Card Snacks 3")),
        Card(child: Text("Card Snacks 3")),
        Card(child: Text("Card Snacks 3")),
        Card(child: Text("Card Snacks 3")),
        Card(child: Text("Card Snacks 3")),
        Card(child: Text("Card Snacks 3")),
      ],
    );
  }

  Widget _buildSectionSauces(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        Card(child: Text("Card Sauces 4")),
        Card(child: Text("Card Sauces 4")),
        Card(child: Text("Card Sauces 4")),
        Card(child: Text("Card Sauces 4")),
        Card(child: Text("Card Sauces 4")),
      ],
    );
  }
}
