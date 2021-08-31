require_relative '../../models/user'

describe User do
    describe '#valid?' do
        context "when intialize with valid input" do
            it 'should return true' do
                params = {
                    'username' => 'eca',
                    'email' => 'ecafirhan@gmail.com',
                    'bio' => 'plasma'
                }

                user = User.new(params)
                allow(Mysql2::Client).to receive(:new).and_return(double)
                allow(double).to receive(:query).with(
                    "select id from users where email = '#{user.email}' or username = '#{user.username}'"
                ).and_return([])
                expect(user.valid?).to eq(true)
            end
        end
        context "when initialize with invalid input" do
            it 'should return false' do
                params = {
                    'email' => 'ecafirhan@gmail.com',
                    'bio' => 'plasma'
                }
                user = User.new(params)
                allow(Mysql2::Client).to receive(:new).and_return(double)
                allow(double).to receive(:query).with(
                    "select id from users where email = '#{user.email}' or username = '#{user.username}'"
                ).and_return([])
                expect(user.valid?).to eq(false)
            end
        end
    end
end