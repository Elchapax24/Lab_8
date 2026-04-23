require "test_helper"

class OwnerTest < ActiveSupport::TestCase

  test "valid owner" do
    owner = Owner.new(
      first_name: "John",
      last_name: "Doe",
      email: "john@example.com",
      phone: "123456"
    )
    assert owner.valid?
  end

  test "invalid without first_name" do
    owner = Owner.new(last_name: "Doe", email: "john@example.com", phone: "123")
    assert_not owner.valid?
    assert_includes owner.errors[:first_name], "can't be blank"
  end

end