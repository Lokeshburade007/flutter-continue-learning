class Post {
  final String id;
  final String author;
  final double netRShares;
  final double payout;
  final String title;
  final String updated;
  final String image;
  final String url;

  Post({
    required this.id,
    required this.author,
    required this.netRShares,
    required this.payout,
    required this.title,
    required this.updated,
    required this.image,
    required this.url,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['post_id']?.toString() ?? '',
      author: json['author']?.toString() ?? '',
      netRShares: (json['net_rshares'] is int)
          ? json['net_rshares'].toDouble()
          : double.tryParse(json['net_rshares']?.toString() ?? '0') ?? 0.0,
      payout: double.tryParse(
          json['pending_payout_value']?.toString().replaceAll(' HBD', '') ??
              '0') ??
          0.0,
      title: json['title']?.toString() ?? '',
      updated: json['updated']?.toString() ?? '',
      image: json['image']?.toString()?? '',
      url: json['links']?.toString() ?? '',
    );
  }
}