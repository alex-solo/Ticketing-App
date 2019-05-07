module ApplicationHelper
  def tag_list(ticket)
    if ticket.tags.any?
      ticket.tags.map(&:name).join(', ')
    else
      "-"
    end
  end

  def display_days_ago(created_at)
    (Date.today - created_at.to_date).to_s.split('/')[0]
  end
end