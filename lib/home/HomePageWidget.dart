import 'package:flutter/material.dart';
import 'package:flutter_page_navigation/datamodel/User.dart';
import 'package:flutter_page_navigation/home/vm/HomePageViewModel.dart';
import 'package:flutter_page_navigation/mvvm/view/NextPageWidget.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePageWidget> {
  @override
  void initState() {
    super.initState();
    // you can uncomment this to get all batman movies when the page is loaded
    //Provider.of<MovieListViewModel>(context, listen: false).fetchMovies("batman");
  }

  @override
  Widget build(BuildContext context) {
    HomePageViewModel vm = Provider.of(context);
    if (vm.userInfo == null) {
      vm.getUserInfo();
    }
    return Scaffold(
      appBar: AppBar(title: const Text("HomeScreen")),
      body: Container(
          child: vm.loading ? loader() : displayUserInfo(vm.userInfo)),
    );
  }

  Widget loader() {
    print("Loading");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget displayUserInfo(User? user) {
    print("displayUserInfo");
    return Center(heightFactor: 0.5,
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(user?.name ?? ""), Image(image: user!.icon)],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => const NextPageWidget()));
        },
      ),
    );
  }
}
