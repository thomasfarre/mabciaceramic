puts "Cleaning database..."

Article.destroy_all
User.destroy_all
Order.destroy_all
Cart.destroy_all
CartItem.destroy_all
Item.destroy_all


puts "Creating items..."

item1 = Item.new(
  title: 'Pot à ustensiles de cuisine',
  description: "Création en céramique faite pour habiller et agrémenter votre cuisine. Permet de ranger avec soin et originalité vos ustensiles de cuisine. Objet d'usage quotidien rendant vos ustensiles facile d'accès, toujours à portée de main. Ce pot en céramique est entièrement façonné à la main. Ce dernier est construit selon un modèle géométrique d'empilement de carrés. Il est fait à partir d'une terre grès cuite à 980°C, recouverte d’émail (matière donnant la couleur) et recuite à 1020°C.",
  category: 'Cuisine',
  status: 'pending',
  materials: ["Céramique"],
  width: 130,
  length: 130,
  height: 142,
  price_cents: 6534,
)

item1.photos.attach(io: URI.open("https://i.etsystatic.com/23642979/r/il/ec4233/2794915047/il_1140xN.2794915047_8ukw.jpg"), filename: 'item.jpg', content_type: 'image/jpg')
item1.photos.attach(io: URI.open("https://i.etsystatic.com/23642979/r/il/e19678/2747209810/il_1140xN.2747209810_96hy.jpg"), filename: 'item.jpg', content_type: 'image/jpg')
item1.photos.attach(io: URI.open("https://i.etsystatic.com/23642979/r/il/860db0/2794916221/il_1140xN.2794916221_5dw3.jpg"), filename: 'item.jpg', content_type: 'image/jpg')
item1.photos.attach(io: URI.open("https://i.etsystatic.com/23642979/r/il/040281/2794916711/il_1140xN.2794916711_2d12.jpg"), filename: 'item.jpg', content_type: 'image/jpg')

item1.save!

item2 = Item.new(
  title: 'Statut geisha japonaise',
  description: "Cette statue de geisha est idéale pour ajouter une touche asiatique, japonisante et moderne à votre intérieur. Les geishas symbolisent le charme et le raffinement, faisant de leurs représentations des pièces décoratives de choix. Cette création est entièrement façonnée à la main à partir d'une terre grès cuite à 980°C, recouverte de plusieurs émaux (blanc, noir et bronze), puis recuite à 1020°C.",
  category: 'Décoration',
  status: 'pending',
  materials: ["grès", "terre", "émail"],
  width: 100,
  length: 213,
  height: 65,
  price_cents: 7243,
)

item2.photos.attach(io: URI.open("https://i.etsystatic.com/23642979/r/il/d9a75d/2747286072/il_794xN.2747286072_5rev.jpg"), filename: 'item.jpg', content_type: 'image/jpg')
item2.photos.attach(io: URI.open("https://i.etsystatic.com/23642979/r/il/ce4eda/2794992827/il_794xN.2794992827_pv8j.jpg"), filename: 'item.jpg', content_type: 'image/jpg')
item2.photos.attach(io: URI.open("https://i.etsystatic.com/23642979/r/il/7e695d/2794993321/il_794xN.2794993321_664x.jpg"), filename: 'item.jpg', content_type: 'image/jpg')
item2.photos.attach(io: URI.open("https://i.etsystatic.com/23642979/r/il/7d7cd0/2794993679/il_794xN.2794993679_4edq.jpg"), filename: 'item.jpg', content_type: 'image/jpg')

item2.save!

item3 = Item.new(
  title: 'Cachette pour poisson',
  description: "Pièce décorative idéale pour agrémenter et personnaliser votre aquarium d'eau de mer ou d'eau douce. Permet de créer un univers original agréable à regarder et à vivre pour vos animaux aquatiques. Élément indispensable offrant cachette, lieu de repos et de reproduction aux petits poissons ainsi qu'aux crevettes (selon espèces). Relativement neutres, les décorations en céramique constituent de belles alternatives (ou compléments) aux éléments décoratifs vivants. De plus, la porosité de la céramique facilite la colonisation du bac par les bactéries nécessaires à l'écosystème marin. Cette pièce en céramique est façonnée et émaillée entièrement à la main. Au cours de sa fabrication, la terre grès qui la constitue, est cuite à 980°C, recouverte d'émaux (matière fondante donnant la couleur) et enfin recuite à 1020°C.Elle présente une couleur blanche avec des fleurs bleues. L'aspect de la pièce varie en fonction de sa position dans l'aquarium et de l'éclairage.",
  category: 'Aquarium',
  status: 'pending',
  materials: ["terre", "grès", "émail"],
  width: 110,
  length: 150,
  height: 110,
  price_cents: 6790,
)

item3.photos.attach(io: URI.open("https://i.etsystatic.com/23642979/r/il/5a8e54/2748356144/il_794xN.2748356144_ojn9.jpg"), filename: 'item.jpg', content_type: 'image/jpg')
item3.photos.attach(io: URI.open("https://i.etsystatic.com/23642979/r/il/1ae6a4/2747165750/il_794xN.2747165750_f5rv.jpg"), filename: 'item.jpg', content_type: 'image/jpg')
item3.photos.attach(io: URI.open("https://i.etsystatic.com/23642979/r/il/4fe51d/2794871649/il_794xN.2794871649_bqk3.jpg"), filename: 'item.jpg', content_type: 'image/jpg')
item3.photos.attach(io: URI.open("https://i.etsystatic.com/23642979/r/il/448238/2747166020/il_794xN.2747166020_e8e3.jpg"), filename: 'item.jpg', content_type: 'image/jpg')

item3.save!

puts "Creating users..."

user1 = User.create(
  first_name: 'toto',
  last_name: 'letoto',
  email: 'toto@toto.com',
  password: '123456',
  admin: false
)

user2 = User.create(
  first_name: 'tata',
  last_name: 'letoto',
  email: 'tata@tata.com',
  password: '123456',
  admin: true
)
