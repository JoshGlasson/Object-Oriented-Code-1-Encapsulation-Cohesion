require 'secret_diary'

describe SecretDiary do

  it 'locks' do
    subject.lock
    expect(subject.locked).to eq true
  end

  it 'unlocks' do
    subject.unlock
    expect(subject.locked).to eq false
  end

  it 'can add entries' do
    subject.unlock
    subject.add_entry("Hi")
    expect(subject.get_entries).to include "Hi"
  end

  it "can't add entries when locked" do
    allow(subject).to receive(:locked).and_return(true)
    expect { subject.add_entry("Hi") }.to raise_error "Diary Locked"
  end

  it "can't get entries when locked" do
    allow(subject).to receive(:locked).and_return(true)
    expect { subject.get_entries }.to raise_error "Diary Locked"
  end

end
