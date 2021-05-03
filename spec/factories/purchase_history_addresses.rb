FactoryBot.define do
  factory :purchase_history_address do
    post_code          {"123-4567"}
    prefecture_id      {2}
    city               {"福岡市"}
    house_number       {"天神1丁目"}
    building_name      {'天神ビル'}
    phone_number       {'12345678912'}
    token              {"tok_abcdefghijk00000000000000000"}
  end
end
