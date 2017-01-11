class DashboardsController < ApplicationController
  power :always_true

  def show
    observe(current_power)
    head :ok
  end

  def create
    raise 'error during action'
  end

  private

  def observe(object)
    # test spy
  end
end
