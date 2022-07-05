require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  before do
    @audit_log = FactoryBot.create(:audit_log)
  end

  describe 'creation' do
    it 'can be properly created' do
      expect(@audit_log).to be_valid
    end
  end

  describe 'validations' do
    it 'should be required to have user association' do
      @audit_log.user_id = nil
      expect(@audit_log).to_not be_valid
    end

    it 'should always have a status' do
      @audit_log.status = nil
      expect(@audit_log).to_not be_valid
    end

    it 'should be required to have a start_date' do
      @audit_log.start_date = nil
      expect(@audit_log).to_not be_valid
    end
  end

  describe 'default values' do
    before do
      user = FactoryBot.create(:user)
      @new_audit_log = AuditLog.create(user_id: user.id)
    end

    it 'should have a status of pending' do
      expect(@new_audit_log.status).to eq('pending')
    end

    it 'should have a start_date equal to 6 days prior' do
      expect(@new_audit_log.start_date).to eq(Date.today - 6.days)
    end
  end
end
