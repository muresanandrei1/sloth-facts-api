class FactController < ApplicationController
  before_action :set_fact, only: [:show, :update, :destroy]

  def index
    @fact = Fact.order("RANDOM()").limit(1)
    json_resposne(@fact)
  end

  def create
    @fact = Fact.create!(fact_params);
    json_resposne(@fact, :created)
  end

  def show
    json_resposne(@fact)
  end

  def destroy
    @fact.destroy
    head :no_content
  end

  private

  def fact_params
    params.permit(:fact)
  end

  def set_fact
    @fact = Fact.find(params[:id])
  end
end
