String addProtocolToUrl(String url) {
  if (url.contains('http://') || url.contains('https://')) {
    return url;
  } else {
    return 'https://$url';
  }
}
