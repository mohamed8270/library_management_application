class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> content = [
  OnboardingContent(
    image:
        'https://img.freepik.com/free-vector/hand-drawn-flat-design-stack-books-illustration_23-2149341898.jpg',
    title: 'Book at your palm',
    description:
        "Get the latest collection of book when it arrives in your college library without any hardwork",
  ),
  OnboardingContent(
    image:
        'https://cdni.iconscout.com/illustration/premium/thumb/online-order-2750347-2294212.png',
    title: 'Get to your needs',
    description:
        "One platform for every librarian and students, connect them in every possible ways for better solution",
  ),
  OnboardingContent(
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAiBviNpQv_0d3CoUH3VxjO3lLDIe0P5WiTw&usqp=CAU',
    title: 'Contact them hustle free',
    description:
        "Get the correct book at your power of palm with modern day tech revolutionary things",
  ),
];
