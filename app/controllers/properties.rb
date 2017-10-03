class EarBnb < Sinatra::Base

  get '/' do
    redirect '/properties'
  end

  get '/properties' do
    @properties = Property.all
    @message = session['message']
    erb :'properties/index'
  end

  # get '/properties/111' do
  #
  # end
  #
  # get 'propertyies/111/new_comment'
  #
  # end
  #
  # post 'properties/111/post_comment'
  #   redirect 'properties/111'
  # end

  get '/property/:id' do
    @property = Property.get(params['id'])
    # @property.address1
    # @comments = Comment.all(:property_id => params['id'])
    erb(:'properties/property')
  end

  post '/properties' do
    @property = current_user.propertys.new(description: params[:description],:address1 => params[:address1])
    if @property.save
      current_user.save
      redirect '/properties'
    else
      flash.now[:errors] = @property.errors.full_messages
      erb :'properties/new'
    end
    # property = Property.create(
    # :address1 => params[:address1],
    # :price_per_night => params[:price],
    # :description => params[:description]
    # )
    # session['message'] = params[:address1]
    # redirect to('/properties')
  end

  get '/properties/new' do
    erb :'properties/new'
  end

  get '/property/:id' do
    @property = Property.get(params['id'])
    # @property.address1
    # @comments = Comment.all(:property_id => params['id'])
    erb(:'properties/property')

  end

end
