class DietitiansController < ApplicationController
  def all_dietitians
    @dietitians = Dietitian.all
  end

  def show_dietitian
    @dietitian = Dietitian.find(params[:id])
  end

  def edit_dietitian
  	@dietitian = Dietitian.find(params[:id])
  end

  def update_dietitian
    @dietitian = Dietitian.find(params[:id])

    @dietitian.name = params[:name]
    @dietitian.country = params[:country]
    @dietitian.years_of_experience = params[:years_of_experience]
    @dietitian.areas_of_expertise = params[:areas_of_expertise]
    @dietitian.image = params[:image_url]

    if @dietitian.save
      redirect_to "/diet/all_dietitians", :notice => "Dietitian updated successfully."
    else
      render 'edit_diet'
    end
  end

  def rate_dietitian
  	@dietitian = Dietitian.find(params[:id])
  	@rate = params[:rate].to_i

  	@d_rate = @dietitian.rate
  	if (@d_rate == nil)
  		@d_rate = 0 
  	end

  	@real_rate = @d_rate % 10
  	@num_of_voters = @d_rate / 10
  	
  	@new_real_rate = (@real_rate * @num_of_voters + @rate)/(@num_of_voters + 1)
  	@new_num_voters = @num_of_voters + 1
  	@dietitian.rate = @new_num_voters * 10 + @new_real_rate
    
    if @dietitian.save
      redirect_to "/diet/all_dietitians", :notice => "Dietitian was rated successfully."
    else
      render 'show_dietitian'
    end
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
end
