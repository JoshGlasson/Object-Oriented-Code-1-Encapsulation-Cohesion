require 'secret_diary'

describe DiaryStatus do

  it 'locks' do
    subject.lock
    expect(subject.locked).to eq true
  end

  it 'unlocks' do
    subject.unlock
    expect(subject.locked).to eq false
  end
end

describe AddEntry do
  it 'can add entries' do
    allow(subject).to receive(:locked?).and_return(false)
    subject.add_entry("Hi")
    expect(subject.diary).to include "Hi"
  end

  it "can't add entries when locked" do
    allow(subject).to receive(:locked?).and_return(true)
    expect { subject.add_entry("Hi") }.to raise_error "Diary Locked"
  end
end

describe GetDiary do
  let(:addentry) { double(:AddEntry, diary: "Hi") }

  it 'can return entries' do
    allow(subject).to receive(:locked?).and_return(false)
    expect(subject.get_entries(addentry)).to include "Hi"
  end

  it "can't get entries when locked" do
    allow(subject).to receive(:locked?).and_return(true)
    expect { subject.get_entries }.to raise_error "Diary Locked"
  end
end
