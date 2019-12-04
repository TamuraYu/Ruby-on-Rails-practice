class AdminController < ApplicationController

    before_action :admin_required
    require "logger"
end