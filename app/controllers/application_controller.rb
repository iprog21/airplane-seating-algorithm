class ApplicationController < ActionController::Base
  def index
    @seats = [[3,2], [4,3], [2,3], [3,4]]
    @filtered_data = []

    seat_counter = 0
    @seats.each do |seat|
      columns = seat.first
      rows = seat.last

      first_section_order_seat = ['window-seat', 'middle-seat', 'aisle-seat']
      last_section_order_seat = first_section_order_seat.reverse
      any_order_seat =  first_section_order_seat.shuffle

      seats_data = []
      for i in 1..rows do
          seat_order_index = 0
          for j in 1..columns do
              if seat_order_index > 2
                seat_order_index = 0
              end

              seat_class = if seat_counter == 0
                first_section_order_seat[seat_order_index]
              elsif seat_counter == (@seats.size - 1)
                last_section_order_seat[seat_order_index]
              else
                any_order_seat[seat_order_index]
              end

              @filtered_data << {
                seat_class: seat_class,
                row: i,
                column: j,
                value: nil,
                seat_counter: seat_counter
              }

              seat_order_index += 1
          end
      end
      seat_counter += 1
    end

    window_seat_size =  @filtered_data.map{|data| data if data[:seat_class] == 'window-seat'}.compact.size
    middle_seat_size =  @filtered_data.map{|data| data if data[:seat_class] == 'middle-seat'}.compact.size
    aisle_seat_size =  @filtered_data.map{|data| data if data[:seat_class] == 'aisle-seat'}.compact.size

    # aisle, window, middle
    value_counter =  1
    @filtered_data.each do |seat_data|
      if seat_data[:seat_class] == 'aisle-seat'
        seat_data[:value] = value_counter
        value_counter += 1
      end
    end

    @filtered_data.each do |seat_data|
      if seat_data[:seat_class] == 'window-seat'
        seat_data[:value] = value_counter
        value_counter += 1
      end
    end

    @filtered_data.each do |seat_data|
      if seat_data[:seat_class] == 'middle-seat'
        seat_data[:value] = value_counter
        value_counter += 1
      end
    end
    
    @filtered_data = @filtered_data.group_by{|data| data[:seat_counter]}

  end
end
