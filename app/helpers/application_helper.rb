module ApplicationHelper
  
  def owned(post)
    user_signed_in? && current_user.id == post.user_id
  end

  def flash_class(level)
      case level
          when :notice then "alert alert-info"
          when :success then "alert alert-success"
          when :error then "alert alert-error"
          when :alert then "alert alert-error"
      end
  end
end
