require 'rails_helper'

describe UserAuthenticator do
  context "when initialized with code" do
    let(:authenticator) { described_class.new(code: 'sample') }
    let(:authenticator_class) { UserAuthenticator::Oauth }

    describe "#initialize" do
      it "should initialize proper authenticator" do
        expect(authenticator_class).to receive(:new).with('sample')
        authenticator
      end
    end
  end

  context "when initialized with login & password" do
    let(:authenticator) { described_class.new(login: 'jsmith', password: 'secret') }
    let(:authenticator_class) { UserAuthenticator::Standard }

    describe "#initialize" do
      it "should initialize proper authenticator" do
        expect(authenticator_class).to receive(:new).with('jsmith', 'secret')
        authenticator
      end
    end

  end
end
