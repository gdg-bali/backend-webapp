first_oct = DateTime.new(2018, 10, 01, 18)

Event.create(
  name: 'GDG Meetup October',
  description: 'Meetup di bulan Oktober',
  starts_at: first_oct,
  ends_at: first_oct + 3.hours,
  venue: 'Kembali',
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