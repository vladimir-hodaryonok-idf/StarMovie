class ListResponseModel {
  final Map<String, List<String>> headers;
  final List<dynamic> data;

  ListResponseModel({
    required this.headers,
    required this.data,
  });
}
