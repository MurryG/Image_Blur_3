class Image

  def initialize (picture)
    @picture = picture
  end

  def find_the_ones
    ones = []
    @picture.each_with_index do |row_content, row_number|
      row_content.each_with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end

  def blur(distance)
    mnht = distance - 1
    ones = find_the_ones
    @picture.each_with_index do |row_ary, row_number|
      row_ary.each_with_index do |item, col_number|
        ones.each do |one_row_number, one_col_number|
          if row_number == one_row_number && col_number == one_col_number
            @picture[row_number - distance][col_number] = 1 unless row_number == 0 || (row_number - distance) < 0
            @picture[row_number + distance][col_number] = 1 unless (row_number + distance) >= @picture.length
            @picture[row_number][col_number - distance] = 1 unless col_number == 0 || (col_number - distance) < 0
            @picture[row_number][col_number + distance] = 1 unless (col_number + distance) >= row_ary.length

            mnht.times do
              @picture[row_number - mnht][col_number] = 1 unless row_number == 0 || (row_number - mnht) < 0
              @picture[row_number + mnht][col_number] = 1 unless (row_number + mnht) >= @picture.length
              @picture[row_number][col_number - mnht] = 1 unless col_number == 0 || (col_number - mnht) < 0
              @picture[row_number][col_number + mnht] = 1 unless (col_number + mnht) >= row_ary.length

              @picture[row_number - mnht][col_number - 1] = 1 unless row_number == 0 || (row_number - mnht) < 0
              @picture[row_number - mnht][col_number + 1] = 1 unless row_number == 0 || (row_number - mnht) < 0
              @picture[row_number + mnht][col_number - 1] = 1 unless (row_number + mnht) >= @picture.length
              @picture[row_number + mnht][col_number + 1] = 1 unless (row_number + mnht) >= @picture.length
              @picture[row_number - 1][col_number - mnht] = 1 unless col_number == 0 || (col_number - mnht) < 0
              @picture[row_number + 1][col_number - mnht] = 1 unless col_number == 0 || (col_number - mnht) < 0
              @picture[row_number - 1][col_number + mnht] = 1 unless (col_number + mnht) >= row_ary.length
              @picture[row_number + 1][col_number + mnht] = 1 unless (col_number + mnht) >= row_ary.length
              mnht -= 1
            end
          end
        end
      end
    end
  end

  def output_image
    @picture.each do |ary|
      puts ary.join
    end
  end
end