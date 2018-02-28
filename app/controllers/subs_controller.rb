class SubsController < ApplicationController
  before_action :set_sub, only: [:show, :update, :edit, :destroy] # or except: [:index, :new, :create]

  def index
    @subs = Sub.all
  end

  def show
    # @sub = Sub.find # here
  end

  def new
    @sub = Sub.new
  end

  def edit
    # @sub = Sub.find # here
  end

  # all of the above are all GET commands, they all render HTML

  def create
    @sub = Sub.new(sub_p)

    if @sub.save
      redirect_to sub_path(@sub)
    else
      render :new
    end
  end

  def update
    # @sub = Sub.find # here

    if @sub.update(sub_p)
      redirect_to sub_path(@sub)
    else
      render :edit # we rediredct here bc there are error msgs in that page that we can display to our user. but if we redirect to elsewhere we can't do this
    end
  end

  def destroy
    # @sub = Sub.find # here
    @sub.destroy
    redirect_to subs_path
  end

  private
    def sub_p
      params.require(:sub).permit(:name)
    end

    def set_sub
      @sub = Sub.find(params[:id])
    end
end
