require "ghkeys/version"
require 'ghkeys/exceptions'
require "ghkeys/ssh_key"
require "sshkey"
require "httparty"

module GHKeys
  extend self

  def fetch(username)
    response = HTTParty.get("https://github.com/#{username}.keys")
    raise UserNotFound if response.code == 404

    response.split("\n")
  end

  def parse(keys)
    keys.inject [] do |a, k|
      a << SSHKey.new(k)
    end
  end

  def by_username(username)
    parse(fetch(username))
  end
end

module Kernel
  def GHKeys(username)
    by_username(username)
  end
end
