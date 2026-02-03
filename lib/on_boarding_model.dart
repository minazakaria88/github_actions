class OnBoardingModel {
  final String? image;
  final String title;
  final String description;

  OnBoardingModel({this.image, required this.title, required this.description});
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: 'Every flower tells a story.',
    description:
        'Celebrate love, gratitude, and joy with elegant arrangements crafted to express what words can’t.',
  ),
  OnBoardingModel(
    title: 'Be there, even from afar..',
    description:
        'Set reminders for birthdays, anniversaries, and special occasions — and we’ll help you make them unforgettable.',
  ),
  OnBoardingModel(
    title: 'Add your personal touch.',
    description:
        'Send love in your own words — write a message, add a song, or upload a photo that becomes part of the gift.',
  ),
];
