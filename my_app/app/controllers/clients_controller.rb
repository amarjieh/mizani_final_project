class ClientsController < ApplicationController

  def me
    @client = Client.find(current_client.id)
    render 'show_client'
  end
    
  def show_client
    @client = Client.find(params[:id])
  end

  def edit_client
  	@client = Client.find(params[:id])
  end

  def update_client
    @client = Client.find(params[:id])

    @client.username = params[:client_username]
    @client.country = params[:client_country]
    @client.image = params[:client_image]

    if @client.save
      redirect_to "/client/me", :notice => "Client updated successfully."
    else
      render 'edit_client'
    end
  end
end