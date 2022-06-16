class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  def index
    @q = Booking.ransack(params[:q])
    @q.sorts = "fecha_inicio asc" if @q.sorts.empty?
    @bookings = @q.result(distinct: true)
  end

  # GET /bookings or /bookings.json
  def index_eolo
    # @bookings = Booking.where(barco: "eolo")
    @q = Booking.where(barco: "eolo").ransack(params[:q])
    @q.sorts = "fecha_inicio asc" if @q.sorts.empty?
    @bookings = @q.result(distinct: true)
  end

  def index_barqa
    # @bookings = Booking.where(barco: "barqa")
    @q = Booking.where(barco: "barqa").ransack(params[:q])
    @q.sorts = "fecha_inicio asc" if @q.sorts.empty?
    @bookings = @q.result(distinct: true)
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:fecha_inicio, :fecha_final, :barco, :nom, :contacte, :preu, :canal, :observacions)
    end
end
