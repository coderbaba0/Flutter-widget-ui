class BoardModel {
  final String image, title, description;

  BoardModel({
    required this.description,
    required this.title,
    required this.image,
  });
}

List<BoardModel> dummyData = [
  BoardModel(
    description:
        'In particular, the garbled words of lorem ipsum bear an unmistakable resemblance to sections 1.10.32–33 of Cicero\'s work',
    title:
        'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor',
    image: 'assets/images/person1.png',
  ),
  BoardModel(
    description:
        'In particular 2, the garbled words of lorem ipsum bear an unmistakable resemblance to sections 1.10.32–33 of Cicero\'s work',
    title:
        'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor',
    image: 'assets/images/person2.png',
  ),
  BoardModel(
    description:
        'In particular 3, the garbled words of lorem ipsum bear an unmistakable resemblance to sections 1.10.32–33 of Cicero\'s work',
    title:
        'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor',
    image: 'assets/images/person3.png',
  ),
];
