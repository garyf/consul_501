describe DashboardsController, type: :controller do
  it "should not raise an error if the checked power is given" do
    expect { get :show, params: {id: "1"} }.not_to raise_error
  end

  it 'should define a method #current_power that returns the Power' do
    controller.should_receive(:observe).with(kind_of(Power))
    get :show, params: {id: "1"}
  end

  it "should set the current power before the request, and nilify it after the request" do
    controller.send(:current_power).should be_nil
    get :show, params: {id: "1"}
    controller.send(:current_power).should be_nil
  end

  it 'should nilify the current power even if the action raises an error' do
    expect { post :create }.to raise_error(/error during action/)
    Power.current.should be_nil
  end
end
