module LinksHelper
  def comment_counter(link)
    link.root_comments.count == 0 ? "No" : link.root_comments.count
  end

  def small_image
    "200x200"
  end

  def large_image
    "800x800"
  end

  def medium_image
    "479x400"
  end
end
