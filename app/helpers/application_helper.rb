module ApplicationHelper
  def tag_list(ticket)
    if ticket.tags.any?
      ticket.tags.map(&:name).join(', ')
    else
      "-"
    end
  end

  def alphabetize(tags)
    tags.sort_by {|tag| tag.name.downcase}
  end
end