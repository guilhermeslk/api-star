class ActionsController < ApplicationController
  protect_from_forgery :except => [:check_pending]

  def check_pending
    actions = DigitalOceanService.new.check_pending_actions

    render json: actions
  end
end
