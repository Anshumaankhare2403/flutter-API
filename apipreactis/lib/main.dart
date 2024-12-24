// import 'package:apipreactis/post.dart';
// import 'package:apipreactis/newApi/postnew.dart';
import 'package:flutter/material.dart';
import './all_api.dart';
import './post.dart';
import './newApi/postnew.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wall(),
    );
  }
}

// image api add in this project

class Image extends StatefulWidget {
  const Image({super.key});

  @override
  State<Image> createState() => _ImageState();
}

class _ImageState extends State<Image> {
  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  bool isReady = true;
  Post? post;
  ALLApi api = ALLApi();

  void fetchPost() async {
    setState(() {
      isReady = true;
    });
    Post? fetchedPost = await api.getSinglePostWithModle();
    setState(() {
      post = fetchedPost;
      isReady = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: isReady
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : post == null
                  ? const Center(
                      child: Text("Faile to load post. ",
                          style: TextStyle(color: Colors.white)),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Name:${post!.id}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Body:${post!.body}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "ID:${post!.id}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "UID:${post!.title}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    )),
    );
  }
}

class APIS extends StatefulWidget {
  const APIS({super.key});

  @override
  State<APIS> createState() => _APISState();
}

class _APISState extends State<APIS> {
  bool isread = true;
  dynamic postData;
  @override
  void initState() {
    super.initState();
    _loadPost();
  }

  Future<void> _loadPost() async {
    ALLApi api = ALLApi();
    postData = await api.fetchPost();
    setState(() {
      isread = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: isread
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : postData == null
                  ? const Center(
                      child: Text("Faile to load post. ",
                          style: TextStyle(color: Colors.white)),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Title:${postData['title']}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Body:${postData['body']}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "ID:${postData['id']}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "UID:${postData['userId']}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    )),
    );
  }
}

class Multi extends StatefulWidget {
  const Multi({super.key});

  @override
  State<Multi> createState() => _MultiState();
}

class _MultiState extends State<Multi> {
  bool isLoad = true;
  List<PostNew> post = [];
  @override
  void initState() {
    super.initState();
    _MULTAPI();
  }

  Future<void> _MULTAPI() async {
    ALLApi api = ALLApi();
    post = (await api.multi())!;
    setState(() {
      isLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: isLoad
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(
                          "${post[index].id}",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage('${post[index].url}')),
                              ),
                            )
                          ],
                        ));
                  },
                  itemCount: post.length,
                )),
    );
  }
}

class NEWONE extends StatefulWidget {
  const NEWONE({super.key});

  @override
  State<NEWONE> createState() => _NEWONEState();
}

class _NEWONEState extends State<NEWONE> {
  bool isload = true;
  List<Map<String, dynamic>> allPosts = [];
  List<Map<String, dynamic>> post = [];
  int curp = 0;
  int lastp = 20;

  @override
  void initState() {
    super.initState();
    _newonefun();
  }

  Future<void> _newonefun() async {
    ALLApi api = ALLApi();
    var fetchedPosts = await api.newAll();
    if (fetchedPosts != null) {
      setState(() {
        allPosts = fetchedPosts;
        post = fetchedPosts.take(lastp).toList();
        isload = false;
      });
    } else {
      setState(() {
        print("erro");
        isload = false;
      });
    }
  }

  void _loadMore() {
    if (post.length < allPosts.length) {
      setState(() {
        int start = lastp;
        int end =
            (start + lastp > allPosts.length) ? allPosts.length : start + lastp;
        post.addAll(allPosts.sublist(start, end));
        lastp = end;
        curp++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: isload
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          if (index == post.length) {
                            return ElevatedButton(
                                onPressed: () {
                                  _loadMore();
                                  print("Erroe");
                                },
                                child: const Text("LOAD MORE"));
                          }
                          final iterm = post[index];
                          return ListTile(
                            leading: Text(iterm['id'].toString(),
                                style: const TextStyle(color: Colors.red)),
                            title: Text(
                              iterm['id'].toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              iterm['body'] ?? 'No Body',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          );
                        },
                        itemCount: post.length + 1,
                      ),
                    ),
                  ],
                )),
    );
  }
}

class Wall extends StatefulWidget {
  const Wall({super.key});

  @override
  State<Wall> createState() => _WallState();
}

class _WallState extends State<Wall> {
  bool isload = true;
  List<Map<String, dynamic>> allPosts = [];
  List<Map<String, dynamic>> post = [];
  int curp = 5; // Current page
  int perPage = 20; // Number of items per page
  final String accessKey =
      'XozpjdPlBpmKs0Y3sA1UvFOG61DtCXZSvuHxSjU_sSE'; // Replace with your key

  @override
  void initState() {
    super.initState();
    _fetchUnsplashPhotos();
  }

  Future<void> _fetchUnsplashPhotos() async {
    try {
      final response = await http.get(
        Uri.parse(
          // 'https://api.unsplash.com/photos?page=$curp&per_page=$perPage&query=good',
          'https://api.unsplash.com/search/photos?page=5&per_page=20&query=dark&client_id=$accessKey',
        ),
        // headers: {
        //   'Authorization': 'Client-ID $accessKey',
        // },
      );

      if (response.statusCode == 200) {
        List<dynamic> fetchedPosts = json.decode(response.body);
        setState(() {
          allPosts.addAll(fetchedPosts.map((e) => e as Map<String, dynamic>));
          post = allPosts;
          isload = false;
        });
      } else {
        throw Exception('Failed to fetch photos');
      }
    } catch (e) {
      setState(() {
        print("Error: $e");
        isload = false;
      });
    }
  }

  void _loadMore() {
    setState(() {
      curp++;
      isload = true;
    });
    _fetchUnsplashPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: isload
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: post.length + 1,
                      itemBuilder: (context, index) {
                        if (index == post.length) {
                          return ElevatedButton(
                            onPressed: _loadMore,
                            child: const Text("LOAD MORE"),
                          );
                        }
                        final item = post[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            image: DecorationImage(
                              image: NetworkImage(item['urls']['small']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  
                ],
              ),
      ),
    );
  }
}
