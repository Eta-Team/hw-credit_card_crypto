require_relative '../credit_card'
require 'minitest/autorun'

# Feel free to replace the contents of cards with data from your own yaml file
card_details = [
  { num: '4916603231464963',
    exp: 'Mar-30-2020',
    name: 'Soumya Ray',
    net: 'Visa' },
  { num: '6011580789725897',
    exp: 'Sep-30-2020',
    name: 'Nick Danks',
    net: 'Visa' },
  { num: '5423661657234057',
    exp: 'Feb-30-2020',
    name: 'Lee Chen',
    net: 'Mastercard' }
]

cards = card_details.map do |c|
  CreditCard.new(c[:num], c[:exp], c[:name], c[:net])
end

describe 'Test hashing requirements' do
  describe 'Check hashes are consistently produced' do
    # TODO: Check that each card produces the same hash if hashed repeatedly
    it 'Should produce the same hash if hashed repeatedly' do
      cards.each do |each_card|
        _(each_card.hash_secure).must_equal each_card.hash_secure
        _(each_card.hash).must_equal each_card.hash
        _(each_card).wont_be_nil
      end
    end
  end

  describe 'Check for unique hashes' do
    # TODO: Check that each card produces a different hash than other cards
    it 'Should produce a different hash than other cards' do
      hashed_cards = cards.map(&:hash_secure)
      _(hashed_cards.uniq.size).must_equal hashed_cards.size
      # hashed_cards = cards.map(&:hash_secure)
      # puts hashed_cards
    end
  end

  describe 'Check regular hash not same as cryptographic hash' do
    # TODO: Check that each card's hash is different from its hash_secure
    it 'should verify that regular has is different from crypto hash' do
      cards.each do |each_card|
        _(each_card.hash_secure).wont_equal each_card.hash
        _(each_card).wont_be_nil
      end
    end
  end
end
