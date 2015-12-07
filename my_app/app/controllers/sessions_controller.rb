class SessionsController < ApplicationController
 
  def show
    @session = Session.find(params[:id])
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new
    @session.dietitian_id = params[:dietitian_id]
    @session.time = params[:time]
    @session.status = params[:status]
    @session.client_id = params[:client_id]

    if @session.save
      redirect_to "/sessions", :notice => "Session created successfully."
    else
      render 'new'
    end
  end

  def edit
    @session = Session.find(params[:id])
  end

  def update
    @session = Session.find(params[:id])

    @session.dietitian_id = params[:dietitian_id]
    @session.time = params[:time]
    @session.status = params[:status]
    @session.client_id = params[:client_id]

    if @session.save
      redirect_to "/sessions", :notice => "Session updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @session = Session.find(params[:id])

    @session.destroy

    redirect_to "/sessions", :notice => "Session deleted."
  end
end
