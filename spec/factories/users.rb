FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    encrypted_password    { '000000' }
    password_confirmation { '000000' }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '2000-04-01' }
  end
end
