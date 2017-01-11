describe SongsController, type: :controller do
  it "should allow to skip a required power check" do
    expect { get :show, params: {id: "1"} }.not_to raise_error
  end

  it "should raise an error if an action is not checked against a power" do
    expect { put :update, params: {id: "1"} }.to raise_error(Consul::UncheckedPower)
  end
end
