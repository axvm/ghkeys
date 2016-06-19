require "ghkeys/version"
require "httparty"
require 'pry'

module GHKeys
  extend self

  def fetch(username)
    response = HTTParty.get("https://github.com/#{username}.keys")
    raise UserNotFound.new(username) if response.code == 404

    response.split("\n")
  end

  class UserNotFound < StandardError
    attr_reader :user
    def initialize(user, msg="Incorrect username or user not exists.")
      @user = user
      super(msg)
    end
  end
end

module Kernel
  def GHKeys(username)
    GHKeys.fetch(username)
  end
end
