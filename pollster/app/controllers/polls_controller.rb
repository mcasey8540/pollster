class PollsController < ApplicationController

  before_filter :find_poll, only: [:show, :edit, :update]

  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params[:poll])
    @poll.url = Digest::SHA1.hexdigest(@poll.name)
    if @poll.save
      redirect_to @poll
    else
      flash[:notice] = "Poll was not created. Please try again."
      render 'new'
    end
  end

  def show

  end

  def edit
    if params[:url].blank?
      redirect_to poll_path(@poll)
    end
  end

  def update
    if @poll.update_attributes(params[:poll])
      redirect_to @poll
    else
      flash[:notice] = "Poll was not updated. Please try again."
      render 'edit'
    end
  end

private

  def find_poll
     @poll = Poll.find(params[:id])
  end

end
