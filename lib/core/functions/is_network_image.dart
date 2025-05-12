  bool isNetworkImage(String? url) {
    return url!=null&& url.isNotEmpty &&
        (url.startsWith('http://') || url.startsWith('https://'));
  }