require 'active_support/concern'

module TrapDoor
  extend ActiveSupport::Concern

  mattr_accessor :honeypot_field_name
  self.honeypot_field_name = :affiliate_id

  included do
  end

  module ClassMethods
    def trap_door(options = {})
      before_filter :check_params, :only => options[:only], :except => options[:except]
    end
  end

  private

  def check_params
    redirect_to 'http://en.wikipedia.org/wiki/User:Mike_Rosoft/Spambot' unless params[TrapDoor.honeypot_field_name.to_sym].blank?
  end

  module TrapDoorHelper
    def trap_door_field(options = {})
      options = {:style => 'display:none;'}.merge(options)
      text_field_tag(TrapDoor.honeypot_field_name, '', options)
    end
  end
end

ActionController::Base.send :include, TrapDoor
ActionView::Base.send :include, TrapDoor::TrapDoorHelper
