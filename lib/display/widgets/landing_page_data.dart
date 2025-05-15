class LandingPageData {
  final String imagePath;
  final String title;
  final int index;
  final String description;

  LandingPageData({
    required this.imagePath,
    required this.title,
    required this.index,
    required this.description,
  });
}

final List<LandingPageData> landingPagesContent = [
  LandingPageData(
    imagePath: 'assets/images/undraw_pay-with-credit-card_77g6.svg',
    title: 'Direct Pay',
    index: 0,
    description: 'Pay with crypto across Africa effortlessly',
  ),
  LandingPageData(
    imagePath: 'assets/images/undraw_online-banking_l9sn.svg',
    title: 'Accept Payments',
    index: 1,
    description: 'Accept stablecoin payments hassle-free',
  ),
  LandingPageData(
    imagePath: 'assets/images/undraw_stripe-payments_g8qn.svg',
    title: 'Pay Bills',
    index: 2,
    description: 'Pay for utility services and earn rewards',
  ),
];