import 'package:flutter/material.dart';
class PostListPage extends StatelessWidget {
  const PostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posts = [
      {
        'username': 'mcsamm',
        'badge': 'Manager',
        'location': 'HiveGhana',
        'time': '15 hours ago',
        'title': 'Unfolding a new chapter.',
        'description': 'Preparation for 11th borehole in Ghana.',
        'earnings': '\$61.41',
        'votes': '298',
        'comments': '5',
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9YYh5Fk1u9VsWWr1MhkyQeOzeNbtnnMO96g&s',
      },
      {
        'username': 'deythedevil',
        'badge': null,
        'location': 'Hive PH',
        'time': '2 days ago',
        'title': 'Please Help Me Help My Mother',
        'description': "I'm still in doubt of posting blog like this.",
        'earnings': '\$278.02',
        'votes': '1374',
        'comments': '86',
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9YYh5Fk1u9VsWWr1MhkyQeOzeNbtnnMO96g&s',
      },
      // Add more posts as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Posts'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostCard(post: post);
        },
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final Map<String, dynamic> post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(post['imageUrl']),
                  radius: 20,
                ),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          post['username'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (post['badge'] != null)
                          Container(
                            margin: const EdgeInsets.only(left: 8.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2.0),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(
                              post['badge'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                      ],
                    ),
                    Text(
                      '${post['location']} • ${post['time']}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              post['title'],
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              post['description'],
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.monetization_on, color: Colors.green),
                    const SizedBox(width: 4.0),
                    Text(post['earnings']),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.thumb_up, color: Colors.grey),
                    const SizedBox(width: 4.0),
                    Text(post['votes']),
                    const SizedBox(width: 16.0),
                    const Icon(Icons.comment, color: Colors.grey),
                    const SizedBox(width: 4.0),
                    Text(post['comments']),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
