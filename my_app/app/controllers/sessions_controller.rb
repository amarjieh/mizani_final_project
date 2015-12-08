class SessionsController < ApplicationController
 
  def show
    @session = Session.find(params[:id])
  end

  def new_session
    @session = Session.new
    @session.dietitian_id = current_dietitian.id
    @session.time = params[:session_time]
    @session.status = "opened"

    if @session.save
      redirect_to "/my_sessions", :notice => "Session created successfully."
    else
      render 'my_sessions'
    end 
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

  def my_sessions
    if current_client.present?
      @sessions = current_client.sessions
    elsif current_dietitian.present?
      @sessions = current_dietitian.sessions
    end
  end

end
