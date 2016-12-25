class CakesController < ApplicationController
  power crud: :cakes, as: :end_of_association_chain

  def show
    notify_spy
    head :ok
  end

  def index
    notify_spy
    head :ok
  end

  def new
    notify_spy
    head :ok
  end

  def create
    notify_spy
    head :ok
  end

  def edit
    notify_spy
    head :ok
  end

  def update
    notify_spy
    head :ok
  end

  def destroy
    notify_spy
    head :ok
  end

  def custom_action
    notify_spy
    head :ok
  end

  private

  def notify_spy
    observe_end_of_association_chain(end_of_association_chain)
  end

  def observe_end_of_association_chain(scope)
    # spy for spec
  end
end
