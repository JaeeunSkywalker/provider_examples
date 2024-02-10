class TabInfo {
  final String index;
  final String title;
  final String className;

  TabInfo({
    required this.index,
    required this.title,
    required this.className,
  });

  factory TabInfo.fromJson(Map<String, dynamic> json) {
    return TabInfo(
      index: json['index'],
      title: json['title'],
      className: json['className'],
    );
  }
}
