class ProblemsController < ApplicationController
  def index
    @problems = Problem.all
  end

  def show 
    @problem = Problem.find(params[:id])
  end

  def new
  end

  def create
    @problem = Problem.new(problem_params)
    
    if @problem.save
      redirect_to @problem
    else
      render 'new'
    end
  end

  private
    def problem_params
      params.require(:problem).permit(:name, :description)
    end
end
