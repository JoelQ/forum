class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  before_filter :set_locale

  def current_user
    super || NullUser.new
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
