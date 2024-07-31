import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:exec_array/ui/categories_screen.dart';
import 'package:exec_array/ui/event_screen.dart';
import 'package:exec_array/ui/favoturite_screen.dart';
import 'package:exec_array/ui/my_account_screen.dart';
import 'package:exec_array/utils/utils.dart';
import 'package:flutter/material.dart';




 List<String> imgList =    imgList = [
  'https://images.unsplash.com/photo-1519225421980-715cb0215aed?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1464366400600-7168b8af9bc3?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1524824267900-2fa9cbf7a506?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1519167758481-83f550bb49b3?q=80&w=1798&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1524777313293-86d2ab467344?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1665607437981-973dcd6a22bb?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1633102467628-6511a5129a03?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Define the pages you want to display for each tab
  final List<Widget> _pages = [
    HomePage(),
    const CategoriesScreen(),
    const EventScreen(),
    const MyAccountScreen(),
    const FavoturiteScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex], // Display the selected page

        bottomNavigationBar: buildMyNavBar(context),
      
    ),
    
    
    );
  }

Widget buildMyNavBar(BuildContext context)
{
  return  BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  backgroundColor: Theme.of(context).primaryColor,
  selectedItemColor: Colors.white,
  unselectedItemColor: Colors.grey,
  selectedFontSize: 0,
  unselectedFontSize: 0,
  iconSize: 30.0, 
  showSelectedLabels: false,
  showUnselectedLabels: false,
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outline),
      label: 'Favorites',
    ),
      BottomNavigationBarItem(
      icon: Icon(Icons.more_vert),
      label: 'others',
    ),
  ],
);


}

  
//   Widget buildMyNavBar(BuildContext context) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//     decoration: const BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(20),
//         topRight: Radius.circular(20),
//       ),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildNavItem(icon: Icons.home, index: 0),
//         _buildNavItem(icon: Icons.search, index: 1),
//         _buildNavItem(icon: Icons.shopping_cart, index: 2),
//         _buildNavItem(icon: Icons.favorite, index: 3),
//         _buildNavItem(icon: Icons.other_houses_sharp, index: 4)
//       ],
//     ),
//   );
// }

// Widget _buildNavItem({required IconData icon, required int index}) {
//   return InkWell(
//     onTap: () {
//       setState(() {
//         _currentIndex = index;
//       });
//     },
//     child: Icon(
//       icon,
//       color: _currentIndex == index ? Theme.of(context).primaryColor : Colors.grey,
//     ),
//   );
// }




}






// Define the HomePage, CategoriesPage, EventsPage, and AccountPage classes
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  //  fetchData();

    return  SafeArea(
      child: Scaffold(
      
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Stack(
            children: [
              // Display the image
              Image.asset(
                'assets/home_top.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
            height: 150,
              ),
              // Overlay text on the image
               Positioned(
                top: 20.0,
                left: 20.0,
                right: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     const Text(
                    'ExecArray',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                     fontFamily: 'Segoe UI',
                      color: Colors.white
                    ),
                  ),
      
                  
                  const Text(
                    'EVENT MANAGEMENT',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),


              const SizedBox(height: 15),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                             IconButton(
              icon: const Icon(Icons.location_on, color: Colors.white,),
              onPressed: () {},
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(child: Text('Lahore, Punjab,\n Pakistan', style: TextStyle(color: Colors.white,),)),
            ),
                    ],
                  )
      
                  ],
                )
               )
                
              
            ],
          ),
      
      
              // Banner Carousel
              Container(
                height: 200,

                 child: CarouselSlider(
                 options: CarouselOptions(
                     autoPlay: true,
                      aspectRatio: 2.0,
                    enlargeCenterPage: true,
                        ),
                          items: imageSliders,
                      ),


                // child: PageView(
                //   children: [
                //     Image.asset('assets/home_top.jpg', fit: BoxFit.cover),
                //     Image.asset('assets/home_top.jpg', fit: BoxFit.cover),
                //     Image.asset('assets/home_top.jpg', fit: BoxFit.cover),
                //   ],
                // ),
              ),




              
              const SizedBox(height: 10),
      
              
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      
        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CategoryItem(imagePath: 'assets/chair.jpg', label: 'Chairs'),
              CategoryItem(imagePath: 'assets/canopies.jpg', label: 'canopies'),
              CategoryItem(imagePath: 'assets/speaker.jpg', label: 'Speakers'),
              CategoryItem(imagePath: 'assets/tents.jpg', label: 'Tents'),
            ],
          ),
        ),
    


              SizedBox(height: 10),
      
              // Events Section
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Events', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    evenetItem(imagePath:'https://images.unsplash.com/photo-1595407753234-0882f1e77954?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', label:'Wedding'),
                    evenetItem(imagePath:'https://images.unsplash.com/photo-1501527459-2d5409f8cf9f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', label:'Concert'),
                    evenetItem(imagePath:'https://images.unsplash.com/photo-1505373877841-8d25f7d46678?q=80&w=2012&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', label:'Conference'),
                    evenetItem(imagePath:'https://images.unsplash.com/photo-1472653431158-6364773b2a56?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', label:'Event'),

                  ],
                ),
              ),
      




              // Advertisement Section
              
     Container(
            height: 90, // Set the height of the advertisement section
            margin: const EdgeInsets.symmetric(horizontal: 10.0), // Margin around the section
            child: Stack(
            children: [
            // Background Image with rounded corners
       ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Rounded corners
              child: CachedNetworkImage(
              imageUrl: 'https://images.unsplash.com/photo-1472653431158-6364773b2a56?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              ),
            ),
            // Blackish Gradient Overlay
       ClipRRect(
            borderRadius: BorderRadius.circular(20.0), // Same rounded corners
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          // Text Overlay
          const Positioned(
            left: 20.0,
            right: 20.0,
            top: 20.0,
            child: Text(
              'ADVERTISEMENT',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Segoe UI',
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
              SizedBox(height: 10),


                 // 2 Advertisement Secction

                    Container(
            height: 90, // Set the height of the advertisement section
            margin: const EdgeInsets.symmetric(horizontal: 10.0), // Margin around the section
            child: Stack(
            children: [
            // Background Image with rounded corners
       ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Rounded corners
              child: CachedNetworkImage(
              imageUrl: 'https://images.unsplash.com/photo-1595407753234-0882f1e77954?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              ),
            ),
            // Blackish Gradient Overlay
       ClipRRect(
            borderRadius: BorderRadius.circular(20.0), // Same rounded corners
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          // Text Overlay
          const Positioned(
            left: 20.0,
            right: 20.0,
            top: 20.0,
            child: Text(
              'ADVERTISEMENT',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Segoe UI',
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
              SizedBox(height: 10),

      
              // Popular Products Section
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Popular Products', style: TextStyle(fontSize: 20)),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return productItem('Product Name', 'assets/home_top.jpg', 32, 5);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget productItem(String name, String imagePath, double salePrice, double rentPrice) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, fit: BoxFit.cover, height: 100, width: double.infinity),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name, style: TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Sale: \$$salePrice'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Rent: \$$rentPrice / Day'),
          ),
        ],
      ),
    );
  }



final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: item,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                      width: 1000.0
                      ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();


/// this is not working witch later 
void fetchData() async {
  bool isConnected = await Utils().checkInternetConnection();
  if (isConnected) {
    // Proceed with network call
      imgList = [
  'https://images.unsplash.com/photo-1519225421980-715cb0215aed?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1464366400600-7168b8af9bc3?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1524824267900-2fa9cbf7a506?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1519167758481-83f550bb49b3?q=80&w=1798&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1524777313293-86d2ab467344?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1665607437981-973dcd6a22bb?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1633102467628-6511a5129a03?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  
];
  } else {
    // Handle no internet connection scenario
   imgList = [
  'assets/placeholder.jpeg',
    'assets/placeholder.jpeg',
      'assets/placeholder.jpeg'
  
];

  }
}

}


class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const CategoryItem({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(imagePath),
          ),
        ),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}



///  event item 
/// 
class evenetItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const evenetItem({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          width: 150,
          height: 250,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
                CachedNetworkImage(
                  imageUrl: imagePath,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: 150,
                  fit: BoxFit.cover
                  ),
              Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Brief description of event Lorem ipsum dolor sit amet....'))
            ],
            
            
          ),
        ),
     
      ],
    );
  }
}


