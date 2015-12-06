class DietitiansController < ApplicationController
  def index
    @dietitians = Dietitian.all
  end

  def show
    @dietitian = Dietitian.find(params[:id])
  end

  def new
    @dietitian = Dietitian.new
  end

#   def create
#     @dietitian = Session.new
#     @dietitian.dietitian_id = params[:dietitian_id]
#     @dietitian.time = params[:time]
#     @dietitian.status = params[:status]
#     @dietitian.client_id = params[:client_id]

#     if @session.save
#       redirect_to "/sessions", :notice => "Session created successfully."
#     else
#       render 'new'
#     end
#   end

#   def edit
#     @session = Session.find(params[:id])
#   end

#   def update
#     @session = Session.find(params[:id])

#     @session.dietitian_id = params[:dietitian_id]
#     @session.time = params[:time]
#     @session.status = params[:status]
#     @session.client_id = params[:client_id]

#     if @session.save
#       redirect_to "/sessions", :notice => "Session updated successfully."
#     else
#       render 'edit'
#     end
#   end

#   def destroy
#     @session = Session.find(params[:id])

#     @session.destroy

#     redirect_to "/sessions", :notice => "Session deleted."
#   end
# end
