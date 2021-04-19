require "test_helper"

class SubscriberTest < ActiveSupport::TestCase
  test 'invalid if email is nil' do
    subscriber = Subscriber.new(name: 'John Doe', email: nil)
    assert subscriber.invalid?
  end

  test 'invalid if email has no @ symbol' do
    subscriber = Subscriber.new(name: 'John doe', email: 'test.coa')
    assert subscriber.invalid?
  end

  test 'invalid if email has no space in it' do
    subscriber = Subscriber.new(name: 'John doe', email: 'j @test.coa')
    assert subscriber.invalid?
  end

  test 'invalid if email has space at end' do
    subscriber = Subscriber.new(name: 'John doe', email: 'j@test.com ')
    assert subscriber.invalid?
  end

  test 'invalid if name is nil' do
    subscriber = Subscriber.new(name: nil, email: 'test@test.com')
    assert subscriber.invalid?
  end
end
