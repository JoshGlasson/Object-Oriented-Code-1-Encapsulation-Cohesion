

#class SecretDiary
#attr_reader :locked, :diary

#  def initialize
#    @locked = true
#    @diary = []
#  end

#  def lock
#    @locked = true
#  end

#  def unlock
#    @locked = false
#  end

#  def add_entry(text)
#    fail "Diary Locked" if @locked == true
#    @diary << text
#  end

#  def get_entries
#    fail "Diary Locked" if @locked == true
#    return @diary
#  end

#end


class DiaryStatus
  attr_reader :locked

  def initialize
    @locked = true
  end

  def locked
    @locked
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end
end

class AddEntry
    attr_reader :diary, :secret_diary
  def initialize
    @secret_diary = DiaryStatus.new
    @diary = []
  end

  def locked?
    if @secret_diary.locked == true
      true
    else
      false
    end
  end

  def add_entry(text)
    fail "Diary Locked" if locked?
    @diary << text
  end
end

class GetDiary
  attr_reader :secret_diary, :entries
  def initialize
    @secret_diary = DiaryStatus.new
  end

  def locked?
    if @secret_diary.locked == true
      true
    else
      false
    end
  end

  def get_entries(entries = AddEntry.new)
    fail "Diary Locked" if locked?
    return entries.diary
  end
end
