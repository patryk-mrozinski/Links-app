module LinksHelper
  def comment_counter(link)
    link.root_comments.count == 0 ? "No" : link.root_comments.count
  end
end
