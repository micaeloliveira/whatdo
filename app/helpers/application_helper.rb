module ApplicationHelper
  include UsersHelper

  # Wrapper around gravatar_image_tag with some more
  # sensible defaults for the application:
  def gravatar_for(user, options={})
    default_class = "gravatar"

    unless options[:class].nil?
      default_class << " #{options[:class]}"
    end

    gravatar_image_tag(
      user.email, alt: user.name, class: default_class,
      gravatar: { size: options[:size] || 32, default: :identicon }
    )
  end

  # Helper for building share-to-twitter links
  # http://twitter.com/home?status=<msg>
  def link_to_share_to_twitter(message, options={}, &block)
    options[:class] = "twitter-link #{options[:class]}"

    message = URI.encode(message)
    link    = "http://twitter.com/home?status=#{message}"

    send(:link_to, link, options, &block)
  end
end
