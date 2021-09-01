class ApplicationController < ActionController::Base
    skip_before_action :protect_from_forgery
end
