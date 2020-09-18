# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
Transaction.destroy_all
Artwork.destroy_all
User.destroy_all

art_images = ['https://images.unsplash.com/photo-1579762593131-b8945254345c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1722&q=80','https://images.unsplash.com/photo-1561059488-916d69792237?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1560579499-ab30d29dfd9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1541662411770-fd2e3fc64781?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1526304760382-3591d3840148?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1490535004195-099bc723fa1f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1491403938640-b57372002c94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1538642448565-472399e1e630?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1566571756801-6459d6feb690?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1523554888454-84137e72c3ce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60','https://cooltourspain.com/wp-content/uploads/2020/01/street-artists-names.jpg','https://cooltourspain.com/wp-content/uploads/2020/01/Dface-Los-Angeles.jpg','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRF_qnM1pwwUmlc84aIIoEeKUh4YEQ5zjcBCA&usqp=CAU','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRAJ0Mc82VXznxTlkJKdSyeYAmZv9S6wpFVCA&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQyfVem16A_RK5mLtNVZrjZ-WCqvkNCtsSSKg&usqp=CAU','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS33WVRmwf-hPdyfyYFmJjDzaZdAZISzILz8g&usqp=CAU','https://www.dw.com/image/40525708_303.jpg','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTrqIjgj_qlDMwdayhwXCynIRGHFb6mLdLGOw&usqp=CAU','https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcStlA9JuxMNEK7IgxKsl45Mn7C68Zur87vfvQ&usqp=CAU']
street_names = ['Passeig San Joan','Carrer de Napols','Carrer de Corsega','Carrer de Industria','Carrer de Mallorca','Travessera de Gracia','Carrer de Valencia']
puts 'Creating 30 fake users...'
people_images = ['https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60', 'https://images.unsplash.com/photo-1528763380143-65b3ac89a3ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60']
long_descriptions = ['Rhine II, the work of German photographer Gursky, measures almost 12 feet long and 7 feet high. Its enormous size could have allowed for a wealth of compositional possibilities, but the photograph was formally extremely simple. While the actual view (in Germany) was busy with power lines, trees, and livestock, Gursky had removed all of these things through both analogue and digital processes.
Gursky’s use of digital manipulations prompted a lively public discussion about whether photography had now become equal to painting as an art form. His works also felt like a significant paradigm shift to an art public that was not used to seeing color photography at such scale and in such detail. From a distance, the effect was similar to experiencing large-scale canvases by Color Field abstractionists like Mark Rothko or Barnett Newman.
Enigmatic and indelible, Rhine II straddles two worlds. It is a beautiful formal capture of the potential of man in the twentieth and twenty-first centuries—his ability to reshape the world as he would like it to be, for better and for worse.', 'Upon entering the Tate’s Turbine Hall, visitors to Eliasson’s The weather project were greeted by a huge glowing orb that hovered near the ceiling. A fine mist filled the hall, diffusing its spellbinding glow throughout the room. Because this work by the Danish-Icelandic artist effectively used the entire volume of the space, it was called the largest indoor contemporary artwork ever produced. The installation became a phenomenon, and over two million people visited during its run.
The weather project fits into a wider trend, beginning in the late 1990s, in which museums began to regularly install monumental-scale artworks indoors as exhibitions unto themselves. Critics have compared these installations to amusement park rides and viewed their spectacle and pomp as a frivolous pandering to the masses. Yet seen in a more positive light, engaging and experiential contemporary installations are, for one, a great way to get the larger population into the museum to see other works.', 'Huffy Howler upset one’s expectations regarding the materials that could make up a sculpture. Most of its components—including handbags, gravel, and binder clips—were either very close to being garbage, or very cheap. But the New York-based Harrison was able to bring these unusual materials together into a unique kind of cohesiveness that brilliantly teetered between coherence and absurdity. Her sculptures have been labeled “complexes,” and unlike Robert Rauschenberg’s iconic 1950s and 1960s “combines,” which were an integration of painting and sculpture into one, Harrison puts together objects that never entirely seem to combine.
Harrison’s work, and others included in the New Museum’s 2007 opening exhibition “Unmonumental,” offered a counterpoint or even a rejection of the sculpture that dominated the preceding years: the big, brash, Neo-Pop of artists such as Jeff Koons and Takashi Murakami. These artists continually invested substantial time, energy, and money exploring new, ever-shinier materials to fabricate ever-bigger monumental objects to dominate our public spaces. Looking around the New Museum’s show, it was hard to imagine a starker contrast.' , 'Critics often read Wiley’s painting, and his production as a whole, as a powerful questioning of Western art history. As the interpretation goes, Wiley rejects and upends the subjugated or inferior roles in which black or brown men have been represented and places them front and center. Yet as Wiley himself undoubtedly also knows, his work is more complex than this. This work, for example, both lampoons the hyper-masculinity of the original piece (Neoclassical painter Jacques-Louis David’s Napoleon Crossing the Alps from 1801) but also subtly presents male sexuality as a subtext—something rarely seen in Western art history.
Wiley’s success is just one example of how African American art has become much more visible in American galleries, museums, and academia in recent years, after centuries of either exclusion or (at best) inconsistent representation. All the same, major issues remain—the amount of solo shows devoted to African American artists is also still quite small, and while values are increasing for works by historical and contemporary African American artists, this work is still heavily undervalued by the art world compared to the work of white artists of similar accomplishments or career status.
','Jardim Gramacho, a 321-acre plot of land on the northern edge of Rio de Janeiro, was the world’s largest garbage dump until it closed in 2012. Between 2007 and 2010, the Jardim became a kind of studio for Brazilian-born, New York- and Rio-based artist Muniz. The artworks created there became a series called Pictures of Garbage, which recreate iconic images from art history using trash collected from the dump.
Muniz’s work prompts a number of important questions regarding contemporary art. Ethics is a good place to start, especially regarding collaborations with “marginalized” or poorer segments of society, which has become a common practice for contemporary artists interested in socially engaged art. Pictures of Garbage also considers the aesthetics of contemporary political art. Muniz’s work is political, but it does so by avoiding straightforward propaganda and retaining various conceptual layers through its complex formal processes. Very broadly, this is characteristic of much politically engaged art today—for it to succeed from a critical and especially market point of view, it cannot be too straightforward or too heavy-handed with its messaging.
','On May 12, 2008, a 7.9-magnitude earthquake devastated Sichuan Province in western China, killing thousands of young students whose schools may not have met country-wide building standards. The government refused to investigate, and Chinese artist and activist Ai was compelled to act. The son of a poet who was denounced and exiled by the Chinese government, he had made a career out of creating artworks promoting freedom of expression and human rights, and in the process, challenging Chinese cultural values and political authority.
Ai’s most celebrated works related to the earthquake were large-scale sculptures that utilized backpacks as their primary medium. Remembering consisted of nine thousand of these backpacks arranged so that they spelled out “She lived happily for seven years in this world” in Chinese characters. The highly public and prominent placement of Remembering—it covered the massive front facade of the Haus der Kunst in Munich, one of Europe’s most influential art museums—left little doubt as to the institution’s support of the work. At once minimal, monumental, historical, and very emotional, Remembering stood as a powerful and indelible example of a work of art’s ability to engage directly with ongoing political and social issues.',
'The Artist is Present was, in some respects, a very simple work. It consisted of Belgrade-born, sixty-three-year-old performance artist Abramović sitting silent and still in a chair across from another chair in which anyone could sit silently (one at a time) for however long they wanted during business hours at the Museum of Modern Art in New York. Abramović sat for the entire run of her 2010 retrospective, which added up to 736 hours and 30 minutes.Since the millennium, performance—a term currently embraced by some but rejected by other artists who find it too confining or inaccurate—has returned to being considered one of the most progressive art forms of today. Exhibitions such as Abramović’s are undoubtedly one reason for this. Her show drew 850,000 visitors and garnered worldwide media attention, spurring galleries and museums to capitalize on the success.']

first_names = ['Andrea', 'Christopher', 'Joan', 'Lionel', 'Xavi', 'Andrés']
last_names = ['Messi', 'Nadal', 'Guardiola', 'Piqué', '']

10.times do |i|
  user = User.new(
    email:   "user_#{i}@gmail.com",
    password: "password",
    first_name: first_names.sample,
    last_name: last_names.sample,
  )
  file = URI.open(people_images.sample)
  user.photo.attach(io: file, filename: 'person.png', content_type: 'image/png')
  user.save!
  sleep(1.2)
end
puts 'Finished!'

puts 'Creating 50 fake artworks...'
10.times do
  artwork = Artwork.new(
    title:    Faker::BossaNova.song,
    description: long_descriptions.sample,
    price_per_hour:  rand(10..50),
    user: User.all.sample,
    address: "#{rand(100..300)}, #{street_names.sample}, Barcelona, Spain "
  )
  file = URI.open(art_images.sample)
  artwork.photo.attach(io: file, filename: 'artwork.png', content_type: 'image/png')
  artwork.save!
  sleep(1.2)
end
puts 'Finished!'
