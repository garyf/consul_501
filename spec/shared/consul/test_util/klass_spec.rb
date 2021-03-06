require "consul/test_util/klass"

describe Consul::TestUtil::Klass do
  describe ".dup" do
    it "should return a class" do
      User.dup.should be_a(Class)
    end

    it "should return a class with the same name as the original class" do
      User.dup.name.should == "User"
    end

    it "should return a class that instantiates objects that are also instances of the original class" do
      instance = User.dup.new
      instance.should be_a(User)
    end

    it "should return a class that can be modified without changing the original class" do
      copy = User.dup
      copy.class_eval do
        def foo
        end
      end
      copy.new.should respond_to(:foo)
      User.new.should_not respond_to(:foo)
    end

    it "should take a block with is evaluated in the context of the disposable class" do
      copy = User.dup do
        def foo
        end
      end
      copy.new.should respond_to(:foo)
      User.new.should_not respond_to(:foo)
    end

    it "should evaluate the block after the copy has been renamed to the original class name" do
      spy = double("spy")
      spy.should_receive(:observe_name).with("User")
      User.dup do
        spy.observe_name(name)
      end
    end
  end
end
