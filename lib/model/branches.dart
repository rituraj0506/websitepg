class Branch {
  final String image;
  final String title;
  final String description;

  Branch({
    required this.image,
    required this.title,
    required this.description,
  });
}


List<Branch> services = [
  Branch(
    image: 'asset/newyork.png',
    title: 'Nirman Vihar',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque aliquet turpis nulla.',
  ),
   Branch(
    image: 'asset/washington.png',
    title: 'Anand Vihar',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque aliquet turpis nulla.',
  ),
  Branch(
    image: 'asset/london.png',
    title: 'Mukhargi Nagar',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque aliquet turpis nulla.',
  ),
];



