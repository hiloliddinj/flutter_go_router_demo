
final List<MyItem> itemsList = [
  MyItem(id: 100, name: 'Item 1', details: 'Item 1 Details'),
  MyItem(id: 200, name: 'Item 2', details: 'Item 2 Details'),
  MyItem(id: 300, name: 'Item 3', details: 'Item 3 Details'),
  MyItem(id: 400, name: 'Item 4', details: 'Item 4 Details'),
  MyItem(id: 500, name: 'Item 5', details: 'Item 5 Details'),
  MyItem(id: 600, name: 'Item 6', details: 'Item 6 Details'),
];

class MyItem {
  final int id;
  final String name, details;
  MyItem({
    required this.id,
    required this.name,
    required this.details,
});
}