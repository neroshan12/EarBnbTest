require 'carrierwave/datamapper'

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    'property/images'
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end
end

class Property
  include DataMapper::Resource

  belongs_to :user

  property :id,               Serial
  property :description,      Text, required: true, length: 1..300,
                              messages: {
                                presence: "Description must not be empty",
                                length: "Description must not be more than 300 characters"
                              }
  property :created_at,       DateTime
  property :address1,         String
  property :price,            Integer
  property :bedrooms,         Integer
  mount_uploader :file,      ImageUploader

  def format_time(time = @created_at)
    "#{time.strftime("%R")} on #{time.strftime("%d/%-m")}"
  end
end
