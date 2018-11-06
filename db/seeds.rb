kembali = Venue.create(
  name: 'Kembali Innovation Hub',
  maps_url: 'https://goo.gl/maps/iLzRmaUXk3o',
  website_url: 'https://kembali.id/'
)

User.create(name: 'Marvel Alexius', email: 'hades.marvel@gmail.com', public_id: 'dEqEcibtFdfBxXEcRnW1DWgS')
User.create(name: 'Satya Kresna Adi Pratama', email: 'satyakresna6295@gmail.com', public_id: 'Q83pRGZx8mumLEjJFzULvdVt')
User.create(name: 'Yoga Tanaya', email: 'tanayayoga@gmail.com', public_id: 'XNftE2k3pLXBsG8fXFL8R4UK')
User.create(name: 'Ariaseta Setia Alam', email: '07ariaseta@gmail.com', public_id: 'q4ACJRABRkF28eMDQXNXStgU')

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
  description: '
    <p>
  DevFest merupakan sebuah ajang yang besar di mana kalian bisa bertemu dengan para developer baik itu yang berpengalaman maupun yang baru ingin belajar.
  Di acara ini bakal dihadiri oleh para developer yang ahli dalam bidangnya dan akan membahas topik-topik yang tidak ingin kalian lewatkan.
</p>
<p>
  Kami mengundang semua software developer dari berbagai kalangan baik kalian yang sudah berpengalaman atau baru ingin terjun ke dunia pemrograman.
  Manfaatkan momen ini untuk bertemu dengan orang-orang baru, siapa tahu bisa merubah jenjang karir kalian.
</p>
<p class="product-sans text-xs-center mt-4">
  <strong>When Business Meets Technology</strong>
</p>
<p>
  Tahun ini kami akan berkolaborasi dengan BizFest,
  sebuah acara dengan konsep yang sama namun dipersembahkan oleh Google Bussiness Group Bali.
  Oleh karena itu kalian berkesempatan untuk bertemu dengan orang-orang yang ingin mendigitalisasikan bisnisnya atau ingin membangun sebuah bisnis berbasis digital.
</p>
<p>
  Kami nanti akan mengadakan sebuah <strong>Coaching Clinic</strong>.
  Sesi ini merupakan sebuah diskusi antara kalian dengan para mentor yang telah kami siapkan.
  Kalian dapat bertanya langsung entah itu pendapat atau permasalahan yang pernah kalian alami.
  Topik-topik yang tersedia adalah:
  <ul>
    <li>Progressive Web App</li>
    <li>Web Front End Development</li>
    <li>Android Development</li>
    <li>Laravel Development</li>
    <li>Ruby on Rails Development</li>
  </ul>
  <br>
  Topik-topik tersebut masih bersifat tentatif dan kami kemungkinan akan menambahkan topik lainnya.
</p>
<div style="width: 240px; height: 360px; margin: 0 auto; background: #fff;">
    <img src="https://firebasestorage.googleapis.com/v0/b/gdg-bali.appspot.com/o/badge.svg?alt=media&token=2ed6172e-7736-438b-9b93-b6ea606eed8d" alt="">
</div>
<p class="mt-3">
  Daftarkan dirimu sesegera mungkin supaya kami bisa mencetak badge buat kalian seperti ilustrasi di atas.
  Jadi silahkan daftar melalui tombol di bawah ini dan jangan lupa untuk daftar di link
  <a href="https://www.meetup.com/GDG-Bali/events/255353828/" target="_blank">
    meetup kami.
  </a>
  Tambahkan ke google kalender kalian dengan menekan tombol orange di atas.
</p>
  ',
  starts_at: starts_at,
  ends_at: starts_at + 8.hours,
  venue: kembali,
  slug_url: 'devfest-2018'
)
session_yohan = Session.new(name: 'Developing The Progressive Experiences in Your Product', duration: 60, event: devfest, session_type: 'Talks')
session_yohan.users << yohan
session_yohan.save!

session_amu = Session.new(
  name: 'How Google Search Works & 2018 Update',
  duration: 60,
  event: devfest,
  session_type: 'Talks'
)
session_amu.users << amu
session_amu.save!

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
session_prabu.save!

keynote.users << prabu
keynote.save!
