module ApplicationHelper

  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-danger"
        when :alert then "alert alert-warning "
    end
  end

  def is_mine? object
    if current_user
  	 current_user.id == object.user_id
    else
      false
    end
  end
end
