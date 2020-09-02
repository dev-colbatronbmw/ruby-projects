class Float


  def to_check_string

    number_hash = {1 => "One", 2 => "Two", 3 => "Three", 4 => "Four", 5 => "Five", 6 => "Six",
                   7 => "Seven", 8 => "Eight", 9 => "Nine", 10 => "Ten", 11 => "Eleven", 12 => "Twelve",
                   13 => "Thirteen", 14 => "Fourteen", 15 => "Fifteen", 16 => "Sixteen", 17 => "Seventeen",
                   18 => "Eighteen", 19 => "Nineteen", 20 => "Twenty", 30 => "Thirty", 40 => "Forty",
                   50 => "Fifty", 60 => "Sixty", 70 => "Seventy", 80 => "Eighty", 90 => "Ninety"}

    def hundred_thousands
      return self - (self % 100000)
    end

    def ten_thousands
      return self - (self % 10000) - hundred_thousands
    end

    def other_ten_thousands
      return self - (self % 1000) - hundred_thousands
    end

    def thousands
      return self - (self % 1000) - ten_thousands - hundred_thousands
    end

    def hundreds
      return self - (self % 100) - thousands - ten_thousands - hundred_thousands
    end

    def tens
      return self - (self % 10) - hundreds - thousands - ten_thousands - hundred_thousands
    end

    def other_tens
      return (self - hundreds - thousands - ten_thousands - hundred_thousands).to_i
    end

    def ones
      return (self - tens - hundreds - thousands - ten_thousands - hundred_thousands).to_i
    end

    def tenths_place
      return coins - hundredths_place
    end

    def hundredths_place
      return coins.round % 10
    end

    def coins
      return ((self * 100).round % 100).to_i
    end

    def ones_place
      return self.ones
    end

    def tens_place
      return (self.tens).to_i
    end

    def hundreds_place
      return (self.hundreds / 100).to_i
    end

    string_coins = ""

    if coins < 1
      string_coins = "and Zero Cents"
    elsif coins == 1
      string_coins = "and One Cent"
    elsif coins < 21
      string_coins = "and #{number_hash[coins]} Cents"
    elsif coins > 20
      if hundredths_place == 0
        string_coins = "and #{number_hash[tenths_place]} Cents"
      else
        string_coins = "and #{number_hash[tenths_place]} #{number_hash[hundredths_place]} Cents"
      end
    end

    big_num = (self / 1000)

    small_num = (self - (self - (self % 1000)))

    case
    when small_num < 1
      small_string = "Zero dollars #{string_coins}"
    when small_num < 1 && big_num > 0
      small_string = ""
    when small_num > 0 && small_num < 2 && big_num < 1
      small_string = "One dollar #{string_coins}"
    when small_num.other_tens < 21 && small_num < 21
      small_string = "#{number_hash[small_num.to_f.other_tens]} dollars #{string_coins}"
    when small_num.other_tens > 20 && small_num < 100
      case
      when self.ones_place == 0
        small_string = "#{number_hash[small_num.to_f.tens_place]} dollars #{string_coins}"
      else
        small_string = "#{number_hash[small_num.to_f.tens_place]} #{number_hash[small_num.to_f.ones_place]} dollars #{string_coins}"
      end
    when small_num.other_tens < 21 && small_num > 99.99
      case
      when self.ones_place == 0 && self.tens_place == 0 && self.other_tens == 0
        small_string = "#{number_hash[small_num.to_f.hundreds_place]} Hundred dollars #{string_coins}"
      else
        small_string = "#{number_hash[small_num.to_f.hundreds_place]} Hundred #{number_hash[small_num.to_f.other_tens]} dollars #{string_coins}"
      end
    when small_num < 1000 && small_num > 120
      case
      when self.ones_place == 0
        small_string = "#{number_hash[small_num.to_f.hundreds_place]} Hundred #{number_hash[small_num.to_f.tens_place]} dollars #{string_coins}"

      when self.ones_place == 0 && self.tens_place == 0 && self.other_tens == 0
        small_string = "#{number_hash[small_num.to_f.hundreds_place]} Hundred dollars #{string_coins}"

      else
        small_string = "#{number_hash[small_num.to_f.hundreds_place]} Hundred #{number_hash[small_num.to_f.tens_place]} #{number_hash[small_num.to_f.ones_place]} dollars #{string_coins}"
      end
    else
      small_string = "error"
    end
    case
    when big_num.other_tens < 21 && big_num < 21
      big_string = "#{number_hash[big_num.to_f.other_tens]}"
    when big_num.other_tens > 20 && big_num < 100
      big_string = "#{number_hash[big_num.to_f.tens_place]} #{number_hash[big_num.to_f.ones_place]}"
    when big_num.other_tens < 21 && big_num > 99.99
      case
      when big_num.other_tens == 0 && big_num.tens_place == 0 && big_num.ones_place
        big_string = "#{number_hash[big_num.to_f.hundreds_place]} Hundred"
      else
        big_string = "#{number_hash[big_num.to_f.hundreds_place]} Hundred #{number_hash[big_num.to_f.other_tens]}"
      end
    when big_num < 1000 && big_num > 120
      case
      when big_num.ones_place == 0
        big_string = "#{number_hash[big_num.to_f.hundreds_place]} Hundred #{number_hash[big_num.to_f.tens_place]}"
      when big_num.ones_place == 0 && big_num.tens_place == 0
        big_string = "#{number_hash[big_num.to_f.hundreds_place]} Hundred"
      else
        big_string = "#{number_hash[big_num.to_f.hundreds_place]} Hundred #{number_hash[big_num.to_f.tens_place]} #{number_hash[big_num.to_f.ones_place]}"
      end
    else
      big_string = "Not complete"
    end

    case
    when self < 1000
      return small_string
    when self > 999.99
      case
      when self.hundreds_place == 0 && self.tens_place == 0 && self.ones_place == 0
        return "#{big_string} Thousand dollars #{string_coins}"
      else
        return "#{big_string} Thousand, #{small_string}"
      end
    else
      return "Error"
    end
  end
end



