module ApplicationHelper
	def current_user
    if session[:user_id]
      @current_user = User.find session[:user_id]
    end
  end

  def highlightable_li(text, path)
    active = if current_page?(path)
               'active'
             else
               ''
             end

    content_tag :li, class: active do
      link_to text, path
    end


    def error_msg(model)

    if model.errors.any? 
      
        model.errors.full_messages.each do |msg|
            msg 
        end 
    
    end 
  end
 	
end
