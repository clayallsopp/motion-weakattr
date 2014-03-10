class TestDelegate
end

class TestObj
  weak_attr :delegate
end

describe "weak_attr" do

  it "create a WeakRef" do
    @obj = TestObj.new
    @obj.delegate = TestDelegate.new
    @obj.delegate.respond_to?(:weakref_alive?).should == true
  end

  it "returns nil if WeakRef removed" do
    @obj = TestObj.new
    autorelease_pool {
      @obj.delegate = TestDelegate.new
    }
    @obj.delegate.should == nil
  end

  it "works with nil" do
    @obj = TestObj.new
    autorelease_pool {
      @obj.delegate = nil
    }
    @obj.delegate.should == nil
  end
end
