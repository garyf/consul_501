require 'spec_helper'

describe Consul::ActiveRecord do

  describe '.authorize_values_for' do

    it 'should be a shortcut for .assignable_values_for :attribute, :through => lambda { ::Power.current }' do
      klass = Note.disposable_copy
      klass.should_receive(:assignable_values_for).with(:attribute, :option => 'option', :through => kind_of(Proc))
      klass.class_eval do
        authorize_values_for :attribute, :option => 'option'
      end
    end

    it 'should not generate a getter and setter for a @power field (change from previous versions)' do
      klass = Note.disposable_copy do
        authorize_values_for :attribute
      end
      note = klass.new
      note.should_not respond_to(:power)
      note.should_not respond_to(:power=)
    end

    it 'should obtain assignable values from Power.current' do
      Power.current = Power.new
      klass = User.disposable_copy do
        authorize_values_for :role
      end
      user = klass.new(role: 'guest')
      user.assignable_roles.should =~ %w[guest admin]
      expect(user.valid?).to be true

      user_0 = klass.new(role: 'invalid')
      expect(user_0.valid?).to be false
    end
  end
end
