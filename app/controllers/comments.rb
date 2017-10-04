class EarBnb < Sinatra::Base

  get '/property/:id/new_comment' do
    @property_id = params['id']
    erb :'comments'
  end
end
