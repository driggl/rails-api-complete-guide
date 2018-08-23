require 'rails_helper'

describe UserAuthenticator::Standard do
  describe "#perform" do
    let(:authenticator) { described_class.new('jsmith', 'password') }
    subject { authenticator.perform }

    shared_examples_for 'invalid authentication' do
      before { user }

      it "should raise an error" do
        expect{ subject }.to raise_error(
          UserAuthenticator::Standard::AuthenticationError
        )
        expect(authenticator.user).to be_nil
      end
    end

    context "when invalid login" do
      let(:user) { create :user, login: 'ddoe', password: 'password' }
      it_behaves_like 'invalid authentication'
    end

    context "when invalid password" do
      let(:user) { create :user, login: 'jsmith', password: 'secret' }
      it_behaves_like 'invalid authentication'
    end

    context "when successed auth" do
      let(:user) { create :user, login: 'jsmith', password: 'password' }

      before { user }

      it 'should set the user found in db' do
        expect { subject }.not_to change{ User.count }
        expect(authenticator.user).to eq(user)
      end
    end
  end
end
