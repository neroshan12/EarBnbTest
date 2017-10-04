class Comment
    include DataMapper::Resource

    belongs_to :user, :propertys

    comment :id,        Serial
    comment :message    Text, required: true,
                        length: 1..200,
                        messages: {
                          presence: 'Comment must not be empty',
                          length: 'Comment must not be more than 200 characters'
                        }
    property :created_at, DateTime

    def format_time(time = @created_at)
      "#{time.strftime("%R")} on #{time.strftime("%d/%-m")}"
    end
  end
