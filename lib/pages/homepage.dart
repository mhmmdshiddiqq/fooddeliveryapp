import 'package:flutter/material.dart';
import 'package:food_deliver/widgets/shared_text_field.dart';
import 'package:heroicons/heroicons.dart';

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
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Delicious \nfood for You",
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.w900),
              ),
            ),
            SharedTextfield(
              title: "Search",
              controller: _searchController,
              prefixIcon: const Icon(Icons.search),
            ),
            const SizedBox(height: 20),
            _buildTabBar(),
            const SizedBox(height: 15),
            Expanded(
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

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 250, 74, 12),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  bottom: 24,
                ),
                child: Column(
                  children: [
                    _buildDrawerItem(
                      icon: HeroIcons.userCircle,
                      title: "Profile",
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildDrawerItem(
                      icon: HeroIcons.shoppingCart,
                      title: "Orders",
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildDrawerItem(
                      icon: HeroIcons.tag,
                      title: "Offer and Promo",
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildDrawerItem(
                      icon: HeroIcons.newspaper,
                      title: "Privacy Policy",
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildDrawerItem(
                      icon: HeroIcons.shieldExclamation,
                      title: "Security",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(
            child: ListTile(
              title: const Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required HeroIcons icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: HeroIcon(
        icon,
        style: HeroIconStyle.outline,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Colors.white,
      endIndent: 20,
      indent: 55,
      thickness: 1,
    );
  }

  Widget _buildTabBar() {
    return AnimatedBuilder(
      animation: _tabController,
      builder: (context, child) {
        return TabBar(
          controller: _tabController,
          dividerColor: Colors.transparent,
          indicator: const UnderlineTabIndicator(
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
    );
  }

  Widget _buildSectionFood(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "See more",
              style: TextStyle(color: Color.fromARGB(255, 250, 74, 12)),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(3, (index) => _buildFoodCard()),
          ),
        ),
      ],
    );
  }

  Widget _buildFoodCard() {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/image.png',
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            const Text(
              "Card \nFood",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            const Text(
              'Rp 10.000',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 250, 74, 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionDrinks(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "See more",
              style: TextStyle(color: Color.fromARGB(255, 250, 74, 12)),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(3, (index) => _buildDrinksCard()),
          ),
        ),
      ],
    );
  }

  Widget _buildDrinksCard() {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/image.png',
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            const Text(
              "Card \nDrinks",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            const Text(
              'Rp 10.000',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 250, 74, 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionSnacks(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "See more",
              style: TextStyle(color: Color.fromARGB(255, 250, 74, 12)),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(3, (index) => _buildSnacksCard()),
          ),
        ),
      ],
    );
  }

  Widget _buildSnacksCard() {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/image.png',
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            const Text(
              "Card \nSnacks",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            const Text(
              'Rp 10.000',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 250, 74, 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionSauces(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "See more",
              style: TextStyle(color: Color.fromARGB(255, 250, 74, 12)),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(3, (index) => _buildSaucesCard()),
          ),
        ),
      ],
    );
  }

  Widget _buildSaucesCard() {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/image.png',
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            const Text(
              "Card \nSauces",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            const Text(
              'Rp 10.000',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 250, 74, 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
