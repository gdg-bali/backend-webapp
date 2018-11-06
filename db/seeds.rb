# kembali = Venue.create(
#   name: 'Kembali Innovation Hub',
#   maps_url: 'https://goo.gl/maps/iLzRmaUXk3o',
#   website_url: 'https://kembali.id/'
# )

# Event.create(
#   name: 'Flutter Study Jam',
#   description: 'Flutter merupakan sebuah framework dari Google yang berfungsi untuk membuat  sebuah aplikasi iOS dan Android dengan kualitas yang menjanjikan.  Flutter Study Jam merupakan kesempatan yang sangat baik untuk mengenal  lebih dalam tentang framework ini dan sekaligus bertemu dengan  para developer lain yang tertarik dengan framework ini.  Tunggu kabar lebih lanjut dari kami!',
#   cover_img_url: 'https://firebasestorage.googleapis.com/v0/b/gdg-bali.appspot.com/o/events%2Fflutter.jpg?alt=media&token=88211d4d-bf91-4c15-8914-bde1b2bea49f',
#   slug_url: 'flutter-study-jam'
# )

users = [
  {
    name: 'Mahmud Omar',
    email: 'msaladin@google.com'
  },
  {
    name: 'Prabu Rangki',
    email: 'praburangki@gmail.com'
  },
  {
    name: 'Yohan Totting',
    email: 'ytotting@google.com'
  }
]


# # users.each do |u|
# #   User.create(u)
# # end

# # first_ses = Time.zone.parse('2018-10-01 17:00') + 60.minutes

# # Session.create(
# #   name: 'Building Hybrid App with Ionic & Angular',
# #   duration: 60,
# #   user_id: 2,
# #   event: Event.first,
# #   starts_at: first_ses
# # )

# # Session.create(
# #   name: 'Building Hybrid App with Ionic & Angular',
# #   duration: 60,
# #   user_id: 1,
# #   event: Event.first,
# #   starts_at: first_ses + 60.minutes
# # )

# # sessions = [
# #   {
# #     name: 'Google Keynote',
# #     duration: 10,
# #     user_id: 1,
# #     event: event,
# #     starts_at: first_ses + 90.minutes
# #   },
# #   {
# #     name: 'Firebase',
# #     duration: 30,
# #     user_id: 2,
# #     event: event,
# #     starts_at: first_ses
# #   },
# #   {
# #     name: 'PWA',
# #     duration: 30,
# #     user_id: 3,
# #     event: event,
# #     starts_at: first_ses + 30.minutes
# #   },
# #   {
# #     name: 'Android',
# #     duration: 30,
# #     user_id: 4,
# #     event: event,
# #     starts_at: first_ses + 60.minutes
# #   },
# #   {
# #     name: 'React',
# #     duration: 30,
# #     user_id: 1,
# #     event: event,
# #     starts_at: first_ses + 30.minutes
# #   }
# # ]

# # sessions.each do |ses|
# #   Session.create(ses)
# # end
#
amu = User.create(
  name: 'Mahmud Omar',
  email: 'msaladin@google.com',
  avatar_url: 'https://res.cloudinary.com/gdgbali/image/upload/v1540873972/Amu.jpg',
  institution: 'Google'
)

yohan = User.create(
  name: 'Yohan Totting',
  email: 'tyohan@google.com',
  avatar_url: 'https://res.cloudinary.com/gdgbali/image/upload/v1540873972/yohan.jpg',
  institution: 'Google'
)
prabu = User.create(
  name: 'Prabu Rangki',
  email: 'praburangki@gmail.com',
  avatar_url: 'https://lh5.googleusercontent.com/-N3oXhk-xhow/AAAAAAAAAAI/AAAAAAAAA0Y/5-xYlPDUlgU/photo.jpg',
  institution: 'Oddbit'
)
starts_at = Time.zone.parse('2018-11-25 09:00')
devfest = Event.create(
  name: 'DevFest 2018',
  description: 'GDG DevFests merupakan sebuah ajang yang besar di mana  kalian bisa bertemu dengan para developer baik itu yang berpengalaman  maupun yang baru ingin belajar.  Di acara ini bakal dihadiri oleh para developer yang ahli dalam bidangnya  dan akan membahas topik-topik yang tidak ingin kalian lewatkan.  Tunggu kabar lebih lanjut dari kami!',
  starts_at: starts_at,
  ends_at: starts_at + 8.hours,
  slug_url: 'devfest-2018'
)
session_yohan = Session.new(name: 'Developing The Progressive Experiences in Your Product', duration: 60, event: devfest, session_type: 'Talks')
session_yohan.users << yohan

session_amu = Session.new(
  name: 'How Google Search Works & 2018 Update',
  duration: 60,
  event: devfest,
  session_type: 'Talks'
)
session_amu.users << amu

session_prabu = Session.new(
  name: 'Contribution to Community',
  duration: 60,
  event: devfest,
  session_type: 'Talks'
)

keynote = Session.new(
    name: 'Keynote',
    duration: 60,
    event: devfest,
    session_type: 'Talks'
)
session_prabu.users << prabu
