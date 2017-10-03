class Property
  include DataMapper::Resource

  #belongs_to :user

  property :id,               Serial
  property :description,      Text, required: true,
                          length: 1..100,
                          messages: {
                            presence: "Description must not be empty",
                            length: "Description must not be more than 100 characters"
                          }
  property :address1,         String
  property :address2,         String
  property :address3,         String
  property :city,             String
  property :state,            String
  property :post_code,        String
  property :price_per_night,  Integer
  property :bedrooms,         Integer
  property :image_url,        String
  property :created_at,       DateTime

  def format_time(time = @created_at)
    "#{time.strftime("%R")} on #{time.strftime("%d/%-m")}"
  end
end
