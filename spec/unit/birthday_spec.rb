require 'birthday'

describe Birthday do
  let(:month) { Time.now.strftime('%B') }

  describe '#today?' do
    it 'returns true when given date is today' do
      day   = Time.now.strftime('%d')
      month = Time.now.strftime('%B')
      expect(subject.today?(day, month)).to be true
    end

    it 'returns false when given date is not today' do
      day = (Time.now + 60 * 60 * 48).strftime('%d')
      expect(subject.today?(day, month)).to be false
    end
  end

  describe '#time_until_bday' do
    let(:day) { (Time.now + 60 * 60 * 24).strftime('%d') }

    it 'returns 1 when given tomorrow' do
      expect(subject.time_until_bday(day, month)).to be 1
    end

    it 'returns 29 when given 4 weeks away + 1 day' do
      next_month = (Time.now + 60 * 60 * 24 * 30).strftime('%B')
      expect(subject.time_until_bday(day, next_month)).to be 29
    end

    it 'returns 358 when given 1 week ago' do
      day = (Time.now - 60 * 60 * 24 * 7).strftime('%d')
      expect(subject.time_until_bday(day, month)).to be 358
    end

    it 'returns 300 when given 65 days ago' do
      time  = Time.now - 60 * 60 * 24 * 65
      day   = time.strftime('%d')
      month = time.strftime('%B')
      expect(subject.time_until_bday(day, month)).to be 300
    end
  end
end