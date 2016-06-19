require 'spec_helper'

describe GHKeys::SSHKey do

  let(:test_key) { "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFJeIjHeSYD+ixTyfU4fokAYpTb5ZCkLFJQiCXrWR0U0ZiEStZ1FpEk8p8zj4AkFcZPGXkBJ52Yk8kne78GoBbMvNRadgcWY6k2BLf+9g9UfmRgXCyrVJWUSHnnCyY1RX4/mT+uQ3fTpOITg2s8ZqSavWblAkZPrutf83DIkg8Z313iGagaXtyLLYsLK7iUOkVsZ0sgKrSFVrBONv68q1cl/XB8zd295rvGS2QXsB07/8c4X88tF37muY5rXHXYYSwlxO9PWzNFpVIuVr4hPNEoLt7i41y+S575DTPX8zP5eE2wIfHliuAsGRv7t/NVW5YiRaVEn0yL25tcbEiVtMv" }

  describe '#new' do
    let(:incorrect_key) { "ssh-hss InSnowdenWeTrust" }

    it 'returns instance of class' do
      expect(GHKeys::SSHKey.new(test_key)).to be_an_instance_of(GHKeys::SSHKey)
    end

    it 'raises error if base64_key is corrupted or incorrect' do
      expect { GHKeys::SSHKey.new(incorrect_key) }.to raise_error(GHKeys::IncorrectOrCorruptedKey)
    end
  end

  describe '#*_fingerprint methods' do
    let(:key)     { GHKeys::SSHKey.new(test_key) }
    let(:md5)     { "fb:dd:8e:32:10:30:76:11:97:fc:e6:a9:ce:59:dd:66" }
    let(:sha1)    { "65:09:5e:12:f2:00:ff:65:32:37:f0:5b:32:05:8c:5b:41:c2:33:e5" }
    let(:sha256)  { "tXtCQKRzPOloD3o0ETKJGdNpZ5yR2BXPRVdGlpJAtfI=" }

    it 'returns md5 fingerprint' do
      expect(key.md5_fingerprint).to eq(md5)
    end

    it 'returns sha1 fingerprint' do
      expect(key.sha1_fingerprint).to eq(sha1)
    end

    it 'returns sha256_fingerprint' do
      expect(key.sha256_fingerprint).to eq(sha256)
    end

  end

end
