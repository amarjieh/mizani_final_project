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

  def homepage
  end

  def book
      @session = Session.find(params[:session])
      @session.status = "booked"
      @session.client_id = params[:client]

      if @session.save
        redirect_to "/my_sessions", :notice => "Session updated successfully."
      else
        render 'my_sessions'
    end
  end

  def clientbook
      @session = Session.find(params[:session_id])
      @session.status = "booked"
      @session.client_id = params[:client]

      if @session.save
        redirect_to "/my_sessions", :notice => "Session updated successfully."
      else
        render 'my_sessions'
      end
  end
    
  # end

  def destroy
    @session = Session.find(params[:id])

    @session.destroy

    redirect_to "/my_sessions", :notice => "Session deleted."
  end

  def my_sessions
    @allsessions = Session.all
    if current_client.present?
      @sessions = current_client.sessions
    elsif current_dietitian.present?
      @sessions = current_dietitian.sessions
    end
  end

end
