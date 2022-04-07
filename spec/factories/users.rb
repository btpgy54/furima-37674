FactoryBot.define do
  factory :user do
    nickname              { 'furima太郎' }
    email                 { 'test@test.com' }
    password              { 'a0000a' }
    password_confirmation { 'a0000a' }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '2000-04-01' }
  end
end
