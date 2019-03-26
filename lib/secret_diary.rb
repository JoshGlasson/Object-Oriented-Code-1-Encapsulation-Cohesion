

class SecretDiary
attr_reader :locked, :diary

  def initialize
    @locked = true
    @diary = []
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end

  def add_entry(text)
    fail "Diary Locked" if @locked == true
    @diary << text
  end

  def get_entries
    fail "Diary Locked" if @locked == true
    return @diary
  end

end
