class JobPositionsController < ApplicationController
  before_action :is_recruiter?, only: [:create, :destroy]

  def job_params
    params.require(:job_position).permit(:title, :dept, :opennum, :description, :requirement)
  end
  
  def show
    @job = JobPosition.find(params[:id])
  end
  def create
    @job = JobPosition.new(job_params)
    if @job.save
      flash.now[:success] = "A new job is created."
      redirect_to @job
    end
  end

  def new
    @job = JobPosition.new
  end
  
  def destroy
  end
end
