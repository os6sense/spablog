class PostDecorator < Draper::Decorator
  include ActionView::Helpers::DateHelper
  delegate_all

  def user_buttons(actions)
    (a = *actions).reduce(h.tag('span')) do |tag, action|
      tag << case action
             when :view
               h.link_to('MORE ...', object,
                         id: "post_#{id}",
                         'data-toggle': 'modal',
                         'data-target': '#fsModal',
                         class: 'read_more_btn')  << ' '
             when :back
               #h.link_to('CLOSE', h.posts_path,
                         #class: 'btn btn-default')
             end
    end
  end

  def admin_buttons(actions)
    return unless h.admin_signed_in?

    (a = *actions).reduce(h.tag('span')) do |tag, action|
      tag << case action
             when :new
               h.link_to('NEW POST', h.new_post_path, class: :nav_item)
             when :change
               h.link_to('CHANGE', h.edit_post_path(object),
                         class: :'post_admin_btn') << ' '
             when :delete
               h.link_to('DELETE', object, method: :delete,
                                           class: 'post_admin_btn',
                                           data: { confirm: 'Are you sure?' })
             end
    end
  end

  def calculate_post_height(rows, cols)
    height = (rows == 2 ? 762 : 376)
    "height: #{height}px;"
  end

  def calculate_summary_height(rows, cols)
    height = (rows == 2 ? 702 : 316)
    #height -= 10 if h.admin_signed_in?
    "height: #{height}px;"
  end

  def formatted_date
    if (d = post.publication_date)
      #  d.strftime('%d %M %Y') :
      distance_of_time_in_words(Date.today(), d) << ' ago'
    else
      'unpublished'
    end
  end

  def formatted_time
    (t = post.publication_date) ? t.to_formatted_s(:time) : ''
  end

  def formatted_summary(rows, cols)
    min = 512
    summary_len = if rows == 2
                    1276
                  else
                    case cols
                    when 2..4
                      min
                    when 6
                      768
                    when 12
                      1276
                    else
                      min
                    end
                  end

    post.summary(summary_len).html_safe
  end
end

class PostsDecorator < Draper::CollectionDecorator
  delegate :length

  MAX_LAYOUT_WIDTH = 2

  # Generate a random layout based on the number of columns to
  # use for the layout width.
  def layout(layout_width)
    idx, str = 0, ''

    #layout_width = 4
    layout_length = object.length - (layout_remainder = object.length % layout_width)

    while idx < layout_length - 1 do
      generate_division(layout_width).each do | val |
      # [5, 5].each do | val |
        str += h.render partial: "layouts/layout_#{val}", locals: { posts: object.slice(idx, val)}
        idx += val
      end
    end

    if layout_remainder > 0
      str += h.render partial: "layouts/layout_#{layout_remainder}", locals: { posts: object.slice(idx, layout_remainder)}
    end

    str.html_safe
  end

  def generate_division(total_layout_width)
    division, sum = [], 0

    while sum < total_layout_width
      new = rand(MAX_LAYOUT_WIDTH) + 2
      if sum + new >= total_layout_width
        division << (total_layout_width - sum)
        sum = total_layout_width
      else
        division << new
      end

      sum += new
    end

    return division
  end
end
