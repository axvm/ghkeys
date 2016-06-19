require 'spec_helper'

describe GHKeys do

  it 'has a version number' do
    expect(GHKeys::VERSION).not_to be nil
  end

  describe '#fetch' do
    let(:test_key) { "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFJeIjHeSYD+ixTyfU4fokAYpTb5ZCkLFJQiCXrWR0U0ZiEStZ1FpEk8p8zj4AkFcZPGXkBJ52Yk8kne78GoBbMvNRadgcWY6k2BLf+9g9UfmRgXCyrVJWUSHnnCyY1RX4/mT+uQ3fTpOITg2s8ZqSavWblAkZPrutf83DIkg8Z313iGagaXtyLLYsLK7iUOkVsZ0sgKrSFVrBONv68q1cl/XB8zd295rvGS2QXsB07/8c4X88tF37muY5rXHXYYSwlxO9PWzNFpVIuVr4hPNEoLt7i41y+S575DTPX8zP5eE2wIfHliuAsGRv7t/NVW5YiRaVEn0yL25tcbEiVtMv" }
    let(:test_user) { 'axvm' }
    let(:incorect_user) { '1.2.3.4.5' }

    it 'returns users array of keys' do
      expect(GHKeys.fetch(test_user)).to be_an_instance_of(Array)
    end

    it 'returns users array of keys with correct test_key' do
      expect(GHKeys.fetch(test_user)).to include(test_key)
    end

    it 'raises error if user not found' do
      expect { GHKeys.fetch(incorect_user) }.to raise_error(GHKeys::UserNotFound)
    end
  end

  describe '#parse' do
    let(:keys) {
      [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFJeIjHeSYD+ixTyfU4fokAYpTb5ZCkLFJQiCXrWR0U0ZiEStZ1FpEk8p8zj4AkFcZPGXkBJ52Yk8kne78GoBbMvNRadgcWY6k2BLf+9g9UfmRgXCyrVJWUSHnnCyY1RX4/mT+uQ3fTpOITg2s8ZqSavWblAkZPrutf83DIkg8Z313iGagaXtyLLYsLK7iUOkVsZ0sgKrSFVrBONv68q1cl/XB8zd295rvGS2QXsB07/8c4X88tF37muY5rXHXYYSwlxO9PWzNFpVIuVr4hPNEoLt7i41y+S575DTPX8zP5eE2wIfHliuAsGRv7t/NVW5YiRaVEn0yL25tcbEiVtMv",
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFJeIjHeSYD+ixTyfU4fokAYpTb5ZCkLFJQiCXrWR0U0ZiEStZ1FpEk8p8zj4AkFcZPGXkBJ52Yk8kne78GoBbMvNRadgcWY6k2BLf+9g9UfmRgXCyrVJWUSHnnCyY1RX4/mT+uQ3fTpOITg2s8ZqSavWblAkZPrutf83DIkg8Z313iGagaXtyLLYsLK7iUOkVsZ0sgKrSFVrBONv68q1cl/XB8zd295rvGS2QXsB07/8c4X88tF37muY5rXHXYYSwlxO9PWzNFpVIuVr4hPNEoLt7i41y+S575DTPX8zP5eE2wIfHliuAsGRv7t/NVW5YiRaVEn0yL25tcbEiVtMv"
      ]
    }

    it 'returns wrapped keys' do
      expect(GHKeys.parse(keys)).to be_an_instance_of(Array)
    end

    it 'returns empty array' do
      ar = []
      res = GHKeys.parse(ar)

      expect(res).to be_an_instance_of(Array)
      expect(res).to eq(ar)
    end
  end

end
