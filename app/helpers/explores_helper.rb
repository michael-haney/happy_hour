module ExploresHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = direction_for_column(column)
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    link_to(title,
      {sort: column, direction: direction}) +
      content_tag(:span, '', class: css_class)
  end

  private
  def direction_for_column(column)
    (column == sort_column && sort_direction == 'asc') ?
      'desc' : 'asc'
  end
end
