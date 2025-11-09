class RoomsController < ApplicationController
  def index
    @rooms = Room.find_by(session[:id]).all
  end

  def show
    @room = Room.find_by(session[:id])
  end

  def new
    @room = Room.new
    @room.room_img = "https://rails-02-sample.herokuapp.com/assets/room/default-image-4e0ac6b8d01335b5b22fe6586af13644ae51dddb6aeabf35b9174e80f13cd09d.png"
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_img, :name, :introduction, :payment_amount, :address))
    if @room.save
      flash[:notice] = "施設の登録に成功しました。"
      redirect_to rooms_path

    else
      flash[:notice] = "施設の登録に失敗しました。"
      render "new", status: :unprocessable_entity
    end
  end

end

