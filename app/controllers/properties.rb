class EarBnb < Sinatra::Base
  get '/' do
    redirect '/properties'
  end

  get '/properties' do
    @properties = Property.all
    erb :'properties/index'
  end

  post '/properties' do
    @property = current_user.propertys.new(description: params[:description],
                                           address1: params[:address1],
                                           price: params[:price],
                                           bedrooms: params[:bedrooms],
                                           file: params[:file]
                                          )
    if @property.save
      current_user.save
      redirect '/properties'
    else
      flash.now[:errors] = @property.errors.full_messages
      erb :'properties/new'
    end
  end

  get '/property/:id' do
    @property = Property.get(params[:id])
    erb :'properties/property'
  end

  get '/properties/new' do
    erb :'properties/new'
  end
end
