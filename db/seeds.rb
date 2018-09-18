first_oct = DateTime.new(2018, 10, 01, 18)

kembali = Venue.create(
  name: 'Kembali Innovation Hub',
  maps_url: 'https://goo.gl/maps/iLzRmaUXk3o',
  website_url: 'https://kembali.id/'
)

Event.create(
  name: 'GDG Meetup October',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel sodales nisl. Duis semper in nulla et ultricies. Fusce nec ex vulputate, posuere neque vel, ultrices sem. Praesent posuere diam in dui vestibulum vestibulum. Donec ornare tortor lacus, non bibendum leo fringilla ac. Vivamus eget sapien eget purus lacinia consequat nec non libero. Curabitur sodales nec arcu eget viverra. Maecenas at neque blandit, molestie nunc in, suscipit turpis.

  Sed ultrices massa eu justo maximus laoreet. Etiam ultrices ante eu tellus tincidunt, in ornare dui pulvinar. Sed eleifend, erat sed mattis sollicitudin, magna neque iaculis sapien, id accumsan dui massa quis metus. Cras ut dolor volutpat, commodo turpis et, vehicula sem. Curabitur fringilla metus nibh, ut molestie sapien blandit sit amet. Pellentesque tempus quam et finibus convallis. Aenean nec odio sodales, pretium felis id, dignissim dui. Proin molestie eleifend convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis dictum elit eu orci varius tempor.
  
  Cras dapibus blandit ex a dictum. Mauris tincidunt, orci quis cursus volutpat, odio nisl aliquet mi, at scelerisque nunc tortor ac nulla. Fusce mollis purus ullamcorper, elementum leo sed, ultrices ante. Proin malesuada laoreet leo vitae mattis. Integer neque metus, mollis nec fringilla ut, pharetra sit amet arcu. Duis dapibus diam nec ex ullamcorper, quis viverra mi dapibus. Vestibulum semper, ex at tincidunt auctor, turpis mauris tristique lorem, ac iaculis lorem mauris vel orci. Suspendisse semper a ipsum in dictum. Morbi laoreet nec dui ut tristique. Cras consequat odio nibh. Morbi aliquet semper aliquam. Vivamus at feugiat quam. Fusce odio nunc, condimentum at tempor et, ornare vel purus. Sed viverra lacus et blandit finibus.
  
  Curabitur dapibus aliquet suscipit. Duis placerat nisi quis urna hendrerit, vitae bibendum mauris pharetra. Nam varius scelerisque justo, sit amet molestie ligula malesuada eu. Praesent dictum ac ex vel egestas. Morbi sed ex elit. Vivamus posuere turpis urna, a euismod massa maximus molestie. Maecenas accumsan aliquam nisi, in mattis ante elementum ac. Suspendisse sagittis malesuada odio. Sed id pellentesque velit, vitae aliquet dui. Nunc sed laoreet ex, eget vulputate ex.',
  starts_at: first_oct,
  ends_at: first_oct + 3.hours,
  venue: kembali,
  cover_img_url: 'https://firebasestorage.googleapis.com/v0/b/gdg-bali.appspot.com/o/events%2Fsangkep.png?alt=media&token=b4e39809-f4fe-466c-894e-9ae30259b67b',
  slug_url: 'gdg-meetup-october'
)

Event.create(
  name: 'Flutter Study Jam',
  description: 'Flutter merupakan sebuah framework dari Google yang berfungsi untuk membuat  sebuah aplikasi iOS dan Android dengan kualitas yang menjanjikan.  Flutter Study Jam merupakan kesempatan yang sangat baik untuk mengenal  lebih dalam tentang framework ini dan sekaligus bertemu dengan  para developer lain yang tertarik dengan framework ini.  Tunggu kabar lebih lanjut dari kami!',
  cover_img_url: 'https://firebasestorage.googleapis.com/v0/b/gdg-bali.appspot.com/o/events%2Fflutter.jpg?alt=media&token=88211d4d-bf91-4c15-8914-bde1b2bea49f',
  slug_url: 'flutter-study-jam'
)

Event.create(
  name: 'DevFest 2018',
  description: 'GDG DevFests merupakan sebuah ajang yang besar di mana  kalian bisa bertemu dengan para developer baik itu yang berpengalaman  maupun yang baru ingin belajar.  Di acara ini bakal dihadiri oleh para developer yang ahli dalam bidangnya  dan akan membahas topik-topik yang tidak ingin kalian lewatkan.  Tunggu kabar lebih lanjut dari kami!',
  cover_img_url: 'https://firebasestorage.googleapis.com/v0/b/gdg-bali.appspot.com/o/events%2Fdevfest.jpg?alt=media&token=c5c6752d-8f2f-4a77-b666-0e07a5768164',
  slug_url: 'devfest-2018'
)