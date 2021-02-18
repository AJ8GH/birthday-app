require 'birthday'
require 'timecop'

describe Birthday do
  ONE_DAY = 60 * 60 * 24 

  let(:now) { Time.now }
  before    { Timecop.freeze(now) }

  describe '#birthday_message' do
    it 'returns Happy Birthday on birthday' do
      day      = now.day
      month    = now.strftime('%B')
      birthday = described_class.new(day, month)
      expect(birthday.message).to eq 'Happy Birthday '
    end

    it "returns birthday in 1 day when given tomorrow" do
      tomorrow = now + ONE_DAY
      day      = tomorrow.day
      month    = tomorrow.strftime('%B')
      birthday = described_class.new(day, month)
      expect(birthday.message).to eq "Your birthday will be in 1 day "
    end

    it 'returns birthday in 35 days when 35 days away' do
      forward_35_days = now + ONE_DAY * 35
      day             = forward_35_days.day
      month           = forward_35_days.strftime('%B')
      birthday        = described_class.new(day, month)
      expect(birthday.message).to eq 'Your birthday will be in 35 days '
    end

    it 'returns birthday in 364 days when given yesterday' do
      yesterday = now - ONE_DAY
      day       = yesterday.day
      month     = yesterday.strftime('%B')
      birthday  = described_class.new(day, month)
      expect(birthday.message).to eq 'Your birthday will be in 364 days '
    end

    it 'returns birthday in 298 days when given 67 days ago' do
      back_67_days = now - ONE_DAY * 67
      day          = back_67_days.day
      month        = back_67_days.strftime('%B')
      birthday     = described_class.new(day, month)
      expect(birthday.message).to eq 'Your birthday will be in 298 days '
    end
  end
end