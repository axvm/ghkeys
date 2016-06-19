module GHKeys
  class SSHKey
    attr_accessor :key

    def initialize(base64_key)
      @key = base64_key

      raise IncorrectOrCorruptedKey unless valid?
    end

    def valid?
      ::SSHKey.valid_ssh_public_key? @key
    end

    def bits
      ::SSHKey.ssh_public_key_bits @key
    end

    def md5_fingerprint
      ::SSHKey.fingerprint @key
    end

    def sha1_fingerprint
      ::SSHKey.sha1_fingerprint @key
    end

    def sha256_fingerprint
      ::SSHKey.sha256_fingerprint @key
    end

    def to_s
      @key
    end

    def inspect
      to_s
    end
  end
end
