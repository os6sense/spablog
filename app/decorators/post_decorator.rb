class PostDecorator < Draper::Decorator
  delegate_all

  def user_buttons(actions)
    (a = *actions).reduce(h.tag("span")) do | tag, action |
      tag << case action
      when :view
        h.link_to('view', object, class: 'btn btn-default')  << ' '
      when :back
        h.link_to('back', h.posts_path, class: 'btn btn-default')
      end
    end
  end

  def admin_buttons(actions)
    return unless h.admin_signed_in?
    
    (a = *actions).reduce(h.tag("span")) do | tag, action |
      tag << case action
      when :new
        h.link_to("new post", h.new_post_path) 
      when :change
        h.link_to('change', h.edit_post_path(object), class: :'btn btn-default') << ' ' 
      when :delete
        h.link_to('delete', object, method: :delete, 
                                    class:'btn btn-default',
                                    data: { confirm: 'Are you sure?' })
      end
    end
  end
end
