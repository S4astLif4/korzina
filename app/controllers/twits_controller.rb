class TwitsController < ApplicationController
  # Грузит метод set_twit но только для метадов [:show, :edit, :update, :destroy]
  before_action :set_twit, only: [:show, :edit, :update, :destroy]

  # GET /twits
  # GET /twits.json
  # Полный список моделей
  def index
    @twits = Twit.all
  end

  # GET /twits/1
  # GET /twits/1.json
  # Каждая модель
  def show
  end

  # GET /twits/new
  # Для создания новой модели
  def new
    @twit = Twit.new
  end

  # GET /twits/1/edit
  # Для редактирования существующей модели
  def edit
  end

  # POST /twits
  # POST /twits.json
  # Создаёт новую модель
  def create
    @twit = Twit.new(twit_params)

    respond_to do |format|
      if @twit.save
        format.html { redirect_to @twit, notice: 'Twit was successfully created.' }
        format.json { render :show, status: :created, location: @twit }
      else
        format.html { render :new }
        format.json { render json: @twit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twits/1
  # PATCH/PUT /twits/1.json
  # Обновляет данные существующей модели
  def update
    respond_to do |format|
      if @twit.update(twit_params)
        format.html { redirect_to @twit, notice: 'Twit was successfully updated.' }
        format.json { render :show, status: :ok, location: @twit }
      else
        format.html { render :edit }
        format.json { render json: @twit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twits/1
  # DELETE /twits/1.json
  # Удаляет существующую модель
  def destroy
    @twit.destroy
    respond_to do |format|
      format.html { redirect_to twits_url, notice: 'Twit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
# Приватные методы
  private
    # Use callbacks to share common setup or constraints between actions.
    # Устанавливает модель берёт параметры сервера и либо редактирует существующую модель либо удаляет
    def set_twit
      @twit = Twit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Отправляет содержания модели в криэйт и в апдэйт либо обновляются либо создаются данные для твитта
    def twit_params
      params.require(:twit).permit(:title, :content)
    end
end
