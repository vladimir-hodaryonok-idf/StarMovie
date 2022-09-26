class ListResponseModel {
  final Map<String, List<String>> headers;
  final List<Map<String, dynamic>> data;

  const ListResponseModel({
    required this.headers,
    required this.data,
  });
}
