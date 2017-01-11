class UsersController < ApplicationController
  power :always_false, map: {show: :always_true}

  def show
    head :ok
  end

  def update
    head :ok
  end
end
