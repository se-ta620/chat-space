FactoryGirl.define do

  factory :message do
    body     Faker::Lorem
    image    Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))
    group
    user
  end
end
