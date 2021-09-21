FactoryBot.define do
  factory :user do
    name {"name"}
    email {"test@gmail.com"}
    password {"password"}
  end

  factory :post do 
    group {"group"}
    request {"request"}
    give {"give"}
    content {"content"}
    img {"img.jpg"}
    movie {"movie.mp4"}
  end
end
